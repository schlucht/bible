package main

import (
	"flag"
	"fmt"
	"log"
	"net/http"
	"os"
	"time"
)

type config struct {
	env  string
	port int
	db   struct {
		dsn string
	}
}

type application struct {
	infoLog  *log.Logger
	errorLog *log.Logger
	version  string
	config   config
}

type jsonResponse struct {
	Error   bool        `json:"error"`
	Message string      `json:"message"`
	Data    interface{} `json:"data,omitempty"`
}

var version = "0.0.1"

func (app *application) serve() error {
	srv := &http.Server{
		Addr:         fmt.Sprintf(":%d", app.config.port),
		Handler:      app.routes(),
		IdleTimeout:  time.Minute,
		ReadTimeout:  5 * time.Second,
		WriteTimeout: 10 * time.Second,
	}
	app.infoLog.Printf("Backend Run on Port (%v): %v", app.version, app.config.port)
	return srv.ListenAndServe()
}

func main() {

	var config config
	infoLog := log.New(os.Stdout, "\n\x1b[32mINFO:\x1b[0m\t", log.Ldate|log.Ltime)
	errorLog := log.New(os.Stdout, "\n\x1b[31mERROR:\x1b[0m\t", log.Ldate|log.Ltime|log.Lshortfile)

	flag.IntVar(&config.port, "port", 5101, "Server port to listen on")
	flag.StringVar(&config.db.dsn, "dsn", "ots:bible@tcp(localhost:3306)/bible?parseTime=true", "DB connect String")
	flag.Parse()
	config.env = "development"

	app := &application{
		infoLog:  infoLog,
		errorLog: errorLog,
		version:  version,
		config:   config,
	}

	err := app.serve()
	if err != nil {
		log.Fatal(err)
	}

}
