package handler

import "context"
import "go-crud-pg/entity"

type ScheduleUsecase interface {
	Fetch(ctx context.Context, cursor string, num int64) ([]entity.Schedule, string, error)
	GetByID(ctx context.Context, id int64) (entity.Schedule, error)
	Update(ctx context.Context, ar *entity.Schedule, id int64) error
	GetByTitle(ctx context.Context, title string) (entity.Schedule, error)
	Store(context.Context, *entity.Schedule) error
	Delete(ctx context.Context, id int64) error
}