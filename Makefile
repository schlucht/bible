BINARY_NAME=bible
PORT=5101
DSN=ots:fhxdb@/fhxdb?parseTime=true

build:
	@go build -o dist/${BINARY_NAME} ./main

api: frontb build
	@env ./dist/${BINARY_NAME} -port=${PORT} &
	@echo "Backend running..."

start: docker api

stop:
	@-pkill -f ${BINARY_NAME}
	@echo "Backend stopped..."

restart: stop api
	clear

clean: stop
	@go clean
	@rm -R ./dist

test:
	@go test ./...

install:
	@go mod tidy

fronta:
	cd frontend && npm start

frontb:
	cd frontent && npm run build

docker:
	docker compose up -d