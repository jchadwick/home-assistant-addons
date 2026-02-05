# https://developers.home-assistant.io/docs/add-ons/configuration#add-on-dockerfile
ARG BUILD_FROM
FROM ${BUILD_FROM}

# Install build dependencies
RUN apk add --no-cache --virtual .build-deps \
    git \
    go \
    gcc \
    musl-dev \
    libpcap-dev

# Install runtime dependencies
RUN apk add --no-cache libpcap

# Build xbslink-ng from source with musl (static linking)
ARG XBSLINK_VERSION=v0.0.1
RUN git clone --depth 1 --branch ${XBSLINK_VERSION} https://github.com/jchadwick/xbslink-ng.git /tmp/xbslink-ng && \
    cd /tmp/xbslink-ng && \
    CGO_ENABLED=1 go build -ldflags="-s -w -linkmode external -extldflags '-static'" -o /usr/local/bin/xbslink-ng ./cmd/xbslink-ng && \
    chmod +x /usr/local/bin/xbslink-ng && \
    cd / && \
    rm -rf /tmp/xbslink-ng

# Remove build dependencies
RUN apk del .build-deps

# Copy root filesystem
COPY rootfs /
