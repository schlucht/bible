package main

import (
	"io"
	"io/fs"
	"net/http"
)

func (app *application) uiHandler(w http.ResponseWriter, r *http.Request, staticFS fs.FS) {
	f, err := staticFS.Open("index.html")
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	defer f.Close()

	seeker, ok := f.(io.ReadSeeker)
	if !ok {
		http.Error(w, "File not found", http.StatusInternalServerError)
		return
	}
	seeker.Seek(0, io.SeekStart)
	http.ServeContent(w, r, "index.html", app.fsStat(f), seeker)
}
