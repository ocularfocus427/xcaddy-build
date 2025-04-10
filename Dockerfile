FROM caddy:builder AS builder

RUN xcaddy build \
    --with github.com/hairyhenderson/caddy-teapot-module

FROM caddy:latest

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
