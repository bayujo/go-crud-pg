package entity

import (
	"context"
	"time"
)

type Cow struct {
	ID        int64     `json:"id"`
	Kode      string    `json:"kode" validate:"required"`
	Nama      string    `json:"nama" validate:"required"`
	Bobot     int8		`json:"bobot" validate:"required"`
	Tanggal   time.Time `json:"tgl_lahir" validate:"required"`
	UpdatedAt time.Time `json:"updated_at"`
	CreatedAt time.Time `json:"created_at"`
}

type CowUsecase interface {
	GetByID(ctx context.Context, id int64) (Cow, error)
}

type CowRepository interface {
	GetByID(ctx context.Context, id string) (Cow, error)
}
