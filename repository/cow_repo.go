package repository

import (
	"context"
	"database/sql"
	"go-crud-pg/entity"
)

type pgsqlCowRepo struct {
	DB *sql.DB
}

func NewPgsqlCowRepository(db *sql.DB) entity.CowRepository {
	return &pgsqlCowRepo {
		DB: db,
	}
}

func (p *pgsqlCowRepo) getOne(ctx context.Context, query string, args ...interface{}) (res entity.Cow, err error) {
	stmt, err := p.DB.PrepareContext(ctx, query)
	if err != nil {
		return entity.Cow{}, err
	}
	row := stmt.QueryRowContext(ctx, args ... )
	res = entity.Cow{}

	err = row.Scan(
		&res.ID,
		&res.Kode,
		&res.Bobot,
		&res.Tanggal,
		&res.UpdatedAt,
		&res.UpdatedAt,
	)

	return
}

func (p *pgsqlCowRepo) GetByID(ctx context.Context, id string) (entity.Cow, error) {
	query := `SELECT * from cow WHERE kode=$1`
	return p.getOne(ctx, query, id)
}