package models

import (
	"context"
	"time"
)

// Cow ...
type Cow struct {
	ID        int64     `json:"id"`
	Kode      string    `json:"kode" validate:"required"`
	Nama      string    `json:"nama" validate:"required"`
	Bobot     int8		`json:"bobot" validate:"required"`
	Tanggal   time.Time `json:"tgl_lahir" validate:"required"`
	UpdatedAt time.Time `json:"updated_at"`
	CreatedAt time.Time `json:"created_at"`
}

// CowUsecase represent the Cow's usecases
type CowUsecase interface {
	Fetch(ctx context.Context, cursor string, num int64) ([]Cow, string, error)
	GetByID(ctx context.Context, id int64) (Cow, error)
	Update(ctx context.Context, ar *Cow) error
	GetByTitle(ctx context.Context, title string) (Cow, error)
	Store(context.Context, *Cow) error
	Delete(ctx context.Context, id int64) error
}

// CowRepository represent the Cow's repository contract
type CowRepository interface {
	Fetch(ctx context.Context, cursor string, num int64) (res []Cow, nextCursor string, err error)
	GetByID(ctx context.Context, id int64) (Cow, error)
	GetByTitle(ctx context.Context, title string) (Cow, error)
	Update(ctx context.Context, ar *Cow) error
	Store(ctx context.Context, a *Cow) error
	Delete(ctx context.Context, id int64) error
}
