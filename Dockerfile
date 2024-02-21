FROM golang:1.20 AS build-stage

WORKDIR /app

COPY go.mod main.go ./

RUN CGO_ENABLED=0 GOOS=linux go build -o /full-cycle-rocks

FROM hello-world:latest

WORKDIR /

COPY --from=build-stage /full-cycle-rocks /full-cycle-rocks

ENTRYPOINT ["/full-cycle-rocks"]
