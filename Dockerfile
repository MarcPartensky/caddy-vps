ARG CADDY_VERSION=2.4.6

FROM caddy:${CADDY_VERSION}-builder AS builder

RUN xcaddy build \
    --with github.com/lucaslorentz/caddy-docker-proxy/plugin/v2 \
    --with github.com/greenpau/caddy-security \
    --with github.com/greenpau/caddy-trace \
	--with github.com/kirsch33/realip

FROM caddy:${CADDY_VERSION}-alpine

RUN apk add --no-cache tzdata

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

CMD ["caddy", "docker-proxy"]
