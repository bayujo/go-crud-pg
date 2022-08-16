package entity

import (
	"context"
	"time"
)

type Cow struct {
	ID        int64     `json:"id"`
	Kode      string    `json:"kode"`
	Nama      string    `json:"nama"`
	Bobot     int8		`json:"bobot"`
	Tanggal   time.Time `json:"tgl_lahir"`
	UpdatedAt time.Time `json:"updated_at"`
	CreatedAt time.Time `json:"created_at"`
}

type CowUsecase interface {
	GetByID(ctx context.Context, id int64) (Cow, error)
}

type CowRepository interface {
	GetByID(ctx context.Context, id string) (Cow, error)
}
