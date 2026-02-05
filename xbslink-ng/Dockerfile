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

# Build xbslink-ng from source
WORKDIR /tmp/build
RUN git clone --depth 1 https://github.com/jchadwick/xbslink-ng.git . && \
    go build -ldflags="-s -w" -o /usr/local/bin/xbslink-ng ./cmd/xbslink-ng && \
    rm -rf /tmp/build

# Remove build dependencies
RUN apk del .build-deps

# Copy root filesystem
COPY rootfs /
