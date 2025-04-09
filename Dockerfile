FROM caddy:latest-builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare
    --with github.com/hslatman/caddy-crowdsec-bouncer

FROM caddy:${VERSION}

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
