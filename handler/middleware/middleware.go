package middleware

import "github.com/labstack/echo"

type GoMiddleWare struct {

}

func (m *GoMiddleWare) CORS(next echo.HandlerFunc) echo.HandlerFunc {
	return func(c echo.Context) error {
		c.Response().Header().Set("Acces-Control-Allow-Origin", "*")
		return next(c)
	}
}

func InitMiddleware() *GoMiddleWare {
	return &GoMiddleWare{}
}