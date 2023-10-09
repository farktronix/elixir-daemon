FROM elixir:alpine as builder

COPY . /build
WORKDIR /build

RUN apk update && apk upgrade && apk add --no-cache make gcc musl-dev
RUN mix deps.get
RUN mix compile

# TODO: Clean up the build image and move into a running image

ENTRYPOINT ["mix", "run", "--no-halt"]
