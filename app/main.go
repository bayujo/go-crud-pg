package main

import (
	"database/sql"
	"fmt"
	"go-crud-pg/handler"
	"go-crud-pg/handler/middleware"
	"go-crud-pg/repository"
	"go-crud-pg/usecase"
	"log"
	"time"

	_ "github.com/lib/pq"
	"github.com/labstack/echo"
	"github.com/spf13/viper"
)

func init() {
	viper.SetConfigFile(`../config.json`)
	err := viper.ReadInConfig()
	if err != nil {
		panic(err)
	}

	if viper.GetBool(`debug`) {
		log.Println("Debug mode on")
	}
}

func main() {
	dbHost := viper.GetString(`database.host`)
	dbPort := viper.GetString(`database.port`)
	dbUser := viper.GetString(`database.user`)
	dbPass := viper.GetString(`database.pass`)
	dbName := viper.GetString(`database.name`)
	sslMode:= viper.GetString(`database.ssl`)
	conn_string := fmt.Sprintf("postgres://%s:%s@%s:%s/%s?sslmode=%s", dbUser, dbPass, dbHost, dbPort, dbName, sslMode)
	dbConn, err := sql.Open(`postgres`, conn_string)

	if err != nil {
		log.Fatal(err)
	}

	err = dbConn.Ping()
	if err != nil {
		log.Fatal(err)
	}

	defer func() {
		err := dbConn.Close()
		if err != nil {
			log.Fatal(err)
		}
	}()

	e := echo.New()
	middl := middleware.InitMiddleware()
	e.Use(middl.CORS)
	cowRepo := repository.NewPgsqlCowRepository(dbConn)
	usersRepo := repository.NewPgsqlUsersRepository(dbConn)
	scheduleRepo := repository.NewPgsqlScheduleRepository(dbConn)

	timeoutContext := time.Duration(viper.GetInt("context.timeout")) * time.Second
	su := usecase.NewScheduleUsecase(scheduleRepo, cowRepo, usersRepo, timeoutContext)
	handler.NewScheduleHandler(e, su)

	log.Fatal(e.Start(viper.GetString("server.address")))
}