# https://developers.home-assistant.io/docs/add-ons/configuration#add-on-dockerfile
ARG BUILD_FROM
FROM ${BUILD_FROM}

ARG XBSLINK_VERSION=v0.0.10

# Build xbslink-ng from source so it links against Alpine/musl + local libpcap.
FROM golang:1.25-alpine AS builder
ARG XBSLINK_VERSION
WORKDIR /src

RUN apk add --no-cache build-base libpcap-dev curl && \
    curl -fsSL "https://github.com/jchadwick/xbslink-ng/archive/refs/tags/${XBSLINK_VERSION}.tar.gz" -o /tmp/xbslink-ng-src.tar.gz && \
    tar -xzf /tmp/xbslink-ng-src.tar.gz --strip-components=1 -C /src && \
    rm -f /tmp/xbslink-ng-src.tar.gz && \
    go build -trimpath -ldflags="-s -w" -o /out/xbslink-ng ./cmd/xbslink-ng

FROM ${BUILD_FROM}

# Install runtime dependencies
RUN apk add --no-cache libpcap curl mosquitto-clients

COPY --from=builder /out/xbslink-ng /usr/local/bin/xbslink-ng

RUN chmod +x /usr/local/bin/xbslink-ng && \
    /usr/local/bin/xbslink-ng --help >/dev/null

# Copy root filesystem
COPY rootfs /
