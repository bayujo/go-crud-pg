package entity

import (
	"context"
	"time"
)

type Users struct {
	ID        int64     `json:"id"`
	Name	  string	`json:"name"`
	Email     string    `json:"email"`
	Phone     string    `json:"no_hp"`
	Alamat    string    `json:"alamat"`
	UpdatedAt time.Time `json:"updated_at"`
	CreatedAt time.Time `json:"created_at"`
}

type UsersUsecase interface {
	GetByID(ctx context.Context, id int64) (Users, error)
}

type UsersRepository interface {
	GetByID(ctx context.Context, id int64) (Users, error)
}
