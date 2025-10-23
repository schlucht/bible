package main

import (
	"embed"
	"io/fs"
	"time"
)

//go:embed static/browser/*
var StaticFiles embed.FS

func (app *application) fsStat(f fs.File) time.Time {
	info, err := f.Stat()
	if err != nil {
		return time.Now()
	}
	return info.ModTime()
}