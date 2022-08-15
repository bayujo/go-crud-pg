package handler

import (
	"go-crud-pg/entity"
	"net/http"
	"strconv"

	"github.com/labstack/echo"
	"github.com/sirupsen/logrus"
	validator "gopkg.in/go-playground/validator.v9"
)

type ResponseError struct {
	Message string `json: "message"`
}

type ScheduleHandler struct {
	SUsecase entity.ScheduleUsecase
}

func NewScheduleHandler(e *echo.Echo, us entity.ScheduleUsecase) {
	handler := &ScheduleHandler{
		SUsecase: us,
	}
	e.GET("/schedules", handler.FetchSchedule)
	e.POST("/schedules", handler.Store)
	e.GET("/schedules/:id", handler.GetByID)
	e.DELETE("/schedules/:id", handler.Delete)
}

func getStatusCode(err error) int {
	if err == nil {
		return http.StatusOK
	}

	logrus.Error(err)
	switch err {
	case entity.ErrInternalServerError:
		return http.StatusInternalServerError
	case entity.ErrNotFound:
		return http.StatusNotFound
	case entity.ErrConflict:
		return http.StatusConflict
	case entity.ErrBadParamInput:
		return http.StatusPartialContent
	default:
		return http.StatusInternalServerError
	}
}

func (s *ScheduleHandler) FetchSchedule(c echo.Context) error {
	numS := c.QueryParam("num")
	num, _ := strconv.Atoi(numS)
	cursor := c.QueryParam("cursor")
	ctx := c.Request().Context()

	listSc, nextCursor, err := s.SUsecase.Fetch(ctx, cursor, int64(num))
	if err != nil {
		return c.JSON(getStatusCode(err), ResponseError{Message: err.Error()})
	}

	c.Response().Header().Set(`X-Cursor`, nextCursor)
	return c.JSON(http.StatusOK, listSc)
}

