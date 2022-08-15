package entity

import "errors"

var (
	ErrInternalServerError = errors.New("internal server error")

	ErrNotFound = errors.New("your resuested Item is not found")

	ErrConflict = errors.New("your item already exist")

	ErrBadParamInput = errors.New("given Param is not valid")
)