package repository

import (
	"context"
	"database/sql"
	"go-crud-pg/entity"
)

type pgsqlUsersRepo struct {
	DB *sql.DB
}

func NewPgsqlUsersRepository(db *sql.DB) entity.UsersRepository {
	return &pgsqlUsersRepo {
		DB: db,
	}
}

func (p *pgsqlUsersRepo) getOne(ctx context.Context, query string, args ...interface{}) (res entity.Users, err error) {
	stmt, err := p.DB.PrepareContext(ctx, query)
	if err != nil {
		return entity.Users{}, err
	}
	row := stmt.QueryRowContext(ctx, args ... )
	res = entity.Users{}

	err = row.Scan(
		&res.ID,
		&res.Name,
		&res.Alamat,
		&res.Email,
		&res.Phone,
		&res.CreatedAt,
		&res.UpdatedAt,
	)

	return
}

func (p *pgsqlUsersRepo) GetByID(ctx context.Context, id int64) (entity.Users, error) {
	query := `SELECT id, name, email, no_hp, alamat, updated_at, created_at from users WHERE id=$1`
	return p.getOne(ctx, query, id)
}