package models

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
	Fetch(ctx context.Context, cursor string, num int64) ([]Users, string, error)
	GetByID(ctx context.Context, id int64) (Users, error)
	Update(ctx context.Context, ar *Users) error
	GetByTitle(ctx context.Context, title string) (Users, error)
	Store(context.Context, *Users) error
	Delete(ctx context.Context, id int64) error
}

type UsersRepository interface {
	Fetch(ctx context.Context, cursor string, num int64) (res []Users, nextCursor string, err error)
	GetByID(ctx context.Context, id int64) (Users, error)
	GetByTitle(ctx context.Context, title string) (Users, error)
	Update(ctx context.Context, ar *Users) error
	Store(ctx context.Context, a *Users) error
	Delete(ctx context.Context, id int64) error
}
