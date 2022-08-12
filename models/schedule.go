package models

import (
	"context"
	"time"
)

// Schedule ...
type Schedule struct {
	ID        int64     `json:"id"`
	Judul     string    `json:"judul" validate:"required"`
	Tanggal   time.Time `json:"tanggal" validate:"required"`
	Users     Users		`json:"users"`
	Cow       Cow		`json:"cow"`
	UpdatedAt time.Time `json:"updated_at"`
	CreatedAt time.Time `json:"created_at"`
}

// ScheduleUsecase represent the Schedule's usecases
type ScheduleUsecase interface {
	Fetch(ctx context.Context, cursor string, num int64) ([]Schedule, string, error)
	GetByID(ctx context.Context, id int64) (Schedule, error)
	Update(ctx context.Context, ar *Schedule) error
	GetByTitle(ctx context.Context, title string) (Schedule, error)
	Store(context.Context, *Schedule) error
	Delete(ctx context.Context, id int64) error
}

// ScheduleRepository represent the Schedule's repository contract
type ScheduleRepository interface {
	Fetch(ctx context.Context, cursor string, num int64) (res []Schedule, nextCursor string, err error)
	GetByID(ctx context.Context, id int64) (Schedule, error)
	GetByTitle(ctx context.Context, title string) (Schedule, error)
	Update(ctx context.Context, ar *Schedule) error
	Store(ctx context.Context, a *Schedule) error
	Delete(ctx context.Context, id int64) error
}
