package main

import (
	"io/fs"
	"net/http"

	"github.com/go-chi/chi/v5"
	"github.com/go-chi/cors"
)

func (app *application) routes() http.Handler {
	mux := chi.NewRouter()

	mux.Use(cors.Handler(cors.Options{
		AllowedOrigins:   []string{"https://*", "http://*"},
		AllowedMethods:   []string{"GET", "POST", "PUT", "DELETE", "OPTIONS"},
		AllowedHeaders:   []string{"Accept", "Authorization", "Content-Type", "X-CSRF-Token"},
		AllowCredentials: false,
		MaxAge:           300,
	}))

	mux.Route("/bible", func(r chi.Router) {
		
	})
	staticFS, _ := fs.Sub(StaticFiles, "static/browser")
	fileServer := http.FileServer(http.FS(staticFS))
	mux.Handle("/static/*", http.StripPrefix("/static", fileServer))
	mux.NotFound(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request){
		app.uiHandler(w, r, staticFS)
	}))
	return mux
}
