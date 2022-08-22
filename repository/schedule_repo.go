package repository

import (
	"context"
	"database/sql"
	"fmt"
	"log"
	"time"

	"go-crud-pg/entity"
	//"github.com/jmoiron/sqlx"
	"github.com/sirupsen/logrus"
)

type pgsqlScheduleRepository struct {
	Conn *sql.DB
}

func NewPgsqlScheduleRepository(Conn *sql.DB) entity.ScheduleRepository {
	return &pgsqlScheduleRepository {Conn}
}

func (p *pgsqlScheduleRepository) fetch(ctx context.Context, query string, args ...interface{}) (result []entity.Schedule, err error) {
	rows, err := p.Conn.QueryContext(ctx, query, args ...)

	if err != nil {
		logrus.Error(err)
		return nil, err
	}

	defer func() {
		errRow := rows.Close()
		if errRow != nil {
			logrus.Error(errRow)
		}
	}()

	result = make([]entity.Schedule, 0)
	for rows.Next() {
		t := entity.Schedule{}
		cowID := string(rune(0))
		usersID := int64(0)
		err = rows.Scan(
			&t.ID,
			&t.Judul,
			&t.Tanggal,
			&usersID,
			&cowID,
			&t.UpdatedAt,
			&t.CreatedAt,
			&t.Status,
		)

		if err != nil {
			logrus.Error(err)
			return nil, err
		}

		t.Cow = entity.Cow{
			Kode: cowID,
		}

		t.Users = entity.Users{
			ID: usersID,
		}

		result = append(result, t)
	}

	return result, nil
}

func (m *pgsqlScheduleRepository) Fetch(ctx context.Context, cursor string, num int64) (res []entity.Schedule, nextCursor string, err error) {
	query := `SELECT * FROM schedule WHERE created_at > $1 ORDER BY created_at LIMIT $2 `

	decodedCursor, err := DecodeCursor(cursor)
	if err != nil && cursor != "" {
		return nil, "", entity.ErrBadParamInput
	}

	res, err = m.fetch(ctx, query, decodedCursor, num)
	if err != nil {
		return nil, "", err
	}

	if len(res) == int(num) {
		nextCursor = EncodeCursor(res[len(res)-1].CreatedAt)
	}

	return
}
func (m *pgsqlScheduleRepository) GetByID(ctx context.Context, id int64) (res entity.Schedule, err error) {
	query := `SELECT * FROM schedule WHERE ID = $1`

	list, err := m.fetch(ctx, query, id)
	if err != nil {
		return entity.Schedule{}, err
	}

	if len(list) > 0 {
		res = list[0]
	} else {
		return res, entity.ErrNotFound
	}

	return
}

func (m *pgsqlScheduleRepository) GetByTitle(ctx context.Context, title string) (res entity.Schedule, err error) {
	query := `SELECT * FROM Schedule WHERE judul = $1`

	list, err := m.fetch(ctx, query, title)
	if err != nil {
		return
	}

	if len(list) > 0 {
		res = list[0]
	} else {
		return res, entity.ErrNotFound
	}
	return
}

func (m *pgsqlScheduleRepository) Store(ctx context.Context, s *entity.Schedule) (err error) {
	query := `INSERT INTO schedule(judul, tanggal, id_cow, id_users, updated_at, created_at) VALUES($1, $2, $3, $4, $5, $6)`
	stmt, err := m.Conn.PrepareContext(ctx, query)
	if err != nil {
		return
	}
	fmt.Println(s.Judul, s.Tanggal, s.Cow.Kode, s.Users.ID)
	_ , err = stmt.ExecContext(ctx, s.Judul, s.Tanggal, s.Cow.Kode, s.Users.ID, time.Now(), time.Now())
	if err != nil {
		return
	}
	
	return err
}

func (m *pgsqlScheduleRepository) Delete(ctx context.Context, id int64) (err error) {
	query := "DELETE FROM schedule WHERE id = $1"

	stmt, err := m.Conn.PrepareContext(ctx, query)
	if err != nil {
		return
	}

	res, err := stmt.ExecContext(ctx, id)
	if err != nil {
		return
	}

	rowsAfected, err := res.RowsAffected()
	if err != nil {
		return
	}

	if rowsAfected != 1 {
		err = fmt.Errorf("weird  Behavior. Total Affected: %d", rowsAfected)
		return
	}

	return
}
func (m *pgsqlScheduleRepository) Update(ctx context.Context, s *entity.Schedule, id int64) (err error) {
	//query := `UPDATE schedule set judul=$1, tanggal=$2, id_cow=$3, id_users=$4, updated_at=$5 WHERE id = $6`
	qb := New(DBPostgres, "UPDATE schedule set")
	if s.Judul != "" {
		qb.AddQuery(" judul = ?,", s.Judul)
	}
	if !s.Tanggal.IsZero() {
		qb.AddQuery(" tanggal = ?,", s.Tanggal)
	}
	if s.Cow.Kode != "" {
		qb.AddQuery(" id_cow = ?,", s.Cow.Kode)
	}
	qb.TrimComma()
	qb.AddQuery(" WHERE id = ?", id)
	
	log.Println(qb.Query())
	//err = sqlx.GetContext(ctx, , qb.Query(), qb.Args())
	stmt, err := m.Conn.PrepareContext(ctx, qb.Query())
	if err != nil {
		return
	}

	res, err := stmt.ExecContext(ctx, qb.Args()...)
	if err != nil {
		return
	}
	affect, err := res.RowsAffected()
	if err != nil {
		return
	}
	if affect != 1 {
		err = fmt.Errorf("weird  Behavior. Total Affected: %d", affect)
		return
	}

	return err
}