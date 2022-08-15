package usecase

import (
	"context"
	"time"

	"github.com/sirupsen/logrus"
	"golang.org/x/sync/errgroup"

	"go-crud-pg/entity"
)

type scheduleUsecase struct {
	scheduleRepo    entity.ScheduleRepository
	cowRepo 		entity.CowRepository
	usersRepo 		entity.UsersRepository
	contextTimeout  time.Duration
}

func NewScheduleUsecase(s entity.ScheduleRepository, c entity.CowRepository, u entity.UsersRepository, timeout time.Duration) entity.ScheduleUsecase {
	return &scheduleUsecase{
		scheduleRepo: s,
		cowRepo: c,
		usersRepo: u,
		contextTimeout: timeout,
	}
}

func (a *scheduleUsecase) fillCowDetails(c context.Context, data []entity.Schedule) ([]entity.Schedule, error) {
	g, ctx := errgroup.WithContext(c)

	// Get the Cow's id
	mapCows := map[string]entity.Cow{}

	for _, Schedule := range data {
		mapCows[Schedule.Cow.Kode] = entity.Cow{}
	}
	// Using goroutine to fetch the Cow's detail
	chanCow := make(chan entity.Cow)
	for cowID := range mapCows {
		cowID := cowID
		g.Go(func() error {
			res, err := a.cowRepo.GetByID(ctx, cowID)
			if err != nil {
				return err
			}
			chanCow <- res
			return nil
		})
	}

	go func() {
		err := g.Wait()
		if err != nil {
			logrus.Error(err)
			return
		}
		close(chanCow)
	}()

	for Cow := range chanCow {
		if Cow != (entity.Cow{}) {
			mapCows[Cow.Kode] = Cow
		}
	}

	if err := g.Wait(); err != nil {
		return nil, err
	}

	// merge the Cow's data
	for index, item := range data {
		if a, ok := mapCows[item.Cow.Kode]; ok {
			data[index].Cow = a
		}
	}
	return data, nil
}

func (a *scheduleUsecase) fillUsersDetails(c context.Context, data []entity.Schedule) ([]entity.Schedule, error) {
	g, ctx := errgroup.WithContext(c)

	mapUsers := map[int64]entity.Users{}

	for _, Schedule := range data {
		mapUsers[Schedule.Users.ID] = entity.Users{}
	}

	chanUsers := make(chan entity.Users)
	for UsersID := range mapUsers {
		UsersID := UsersID
		g.Go(func() error {
			res, err := a.usersRepo.GetByID(ctx, UsersID)
			if err != nil {
				return err
			}
			chanUsers <- res
			return nil
		})
	}

	go func() {
		err := g.Wait()
		if err != nil {
			logrus.Error(err)
			return
		}
		close(chanUsers)
	}()

	for Users := range chanUsers {
		if Users != (entity.Users{}) {
			mapUsers[Users.ID] = Users
		}
	}

	if err := g.Wait(); err != nil {
		return nil, err
	}

	for index, item := range data {
		if a, ok := mapUsers[item.Users.ID]; ok {
			data[index].Users = a
		}
	}
	return data, nil
}

func (a *scheduleUsecase) Fetch(c context.Context, cursor string, num int64) (res []entity.Schedule, nextCursor string, err error) {
	if num == 0 {
		num = 10
	}

	ctx, cancel := context.WithTimeout(c, a.contextTimeout)
	defer cancel()

	res, nextCursor, err = a.scheduleRepo.Fetch(ctx, cursor, num)
	if err != nil {
		return nil, "", err
	}

	res, err = a.fillCowDetails(ctx, res)
	res, err = a.fillUsersDetails(ctx, res)
	if err != nil {
		nextCursor = ""
	}
	return
}

func (a *scheduleUsecase) GetByID(c context.Context, id int64) (res entity.Schedule, err error) {
	ctx, cancel := context.WithTimeout(c, a.contextTimeout)
	defer cancel()

	res, err = a.scheduleRepo.GetByID(ctx, id)
	if err != nil {
		return
	}

	resCow, err := a.cowRepo.GetByID(ctx, res.Cow.Kode)
	if err != nil {
		return entity.Schedule{}, err
	}
	res.Cow = resCow
	return
}

func (a *scheduleUsecase) Update(c context.Context, ar *entity.Schedule) (err error) {
	ctx, cancel := context.WithTimeout(c, a.contextTimeout)
	defer cancel()

	ar.UpdatedAt = time.Now()
	return a.scheduleRepo.Update(ctx, ar)
}

func (a *scheduleUsecase) GetByTitle(c context.Context, title string) (res entity.Schedule, err error) {
	ctx, cancel := context.WithTimeout(c, a.contextTimeout)
	defer cancel()
	res, err = a.scheduleRepo.GetByTitle(ctx, title)
	if err != nil {
		return
	}

	resCow, err := a.cowRepo.GetByID(ctx, res.Cow.Kode)
	if err != nil {
		return entity.Schedule{}, err
	}

	res.Cow = resCow
	return
}

func (a *scheduleUsecase) Store(c context.Context, m *entity.Schedule) (err error) {
	ctx, cancel := context.WithTimeout(c, a.contextTimeout)
	defer cancel()
	existedSchedule, _ := a.GetByTitle(ctx, m.Judul)
	if existedSchedule != (entity.Schedule{}) {
		return entity.ErrConflict
	}

	err = a.scheduleRepo.Store(ctx, m)
	return
}

func (a *scheduleUsecase) Delete(c context.Context, id int64) (err error) {
	ctx, cancel := context.WithTimeout(c, a.contextTimeout)
	defer cancel()
	existedSchedule, err := a.scheduleRepo.GetByID(ctx, id)
	if err != nil {
		return
	}
	if existedSchedule == (entity.Schedule{}) {
		return entity.ErrNotFound
	}
	return a.scheduleRepo.Delete(ctx, id)
}