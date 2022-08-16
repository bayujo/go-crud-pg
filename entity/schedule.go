package entity

import (
	"context"
	"time"
)

type Schedule struct {
	ID        int64     `json:"id"`
	Judul     string    `json:"judul"`
	Tanggal   time.Time `json:"tanggal"`
	Users     Users		`json:"users"`
	Cow       Cow		`json:"cow"`
	UpdatedAt time.Time `json:"updated_at"`
	CreatedAt time.Time `json:"created_at"`
	Status    int8		`json:"status"`
}

type ScheduleRepository interface {
	Fetch(ctx context.Context, cursor string, num int64) (res []Schedule, nextCursor string, err error)
	GetByID(ctx context.Context, id int64) (Schedule, error)
	GetByTitle(ctx context.Context, title string) (Schedule, error)
	Update(ctx context.Context, ar *Schedule) error
	Store(ctx context.Context, a *Schedule) error
	Delete(ctx context.Context, id int64) error
}
