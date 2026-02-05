# https://developers.home-assistant.io/docs/add-ons/configuration#add-on-dockerfile
ARG BUILD_FROM
FROM ${BUILD_FROM}

# Install glibc compatibility (required for Go binaries compiled with CGO)
# The xbslink-ng binary uses glibc, but Alpine uses musl
RUN apk add --no-cache --repository=https://dl-cdn.alpinelinux.org/alpine/edge/community glibc glibc-bin

# Install runtime dependencies
RUN apk add --no-cache libpcap curl

# Download and install xbslink-ng binary from GitHub release
ARG XBSLINK_VERSION=v0.0.1
RUN curl -fsSL "https://github.com/jchadwick/xbslink-ng/releases/download/${XBSLINK_VERSION}/xbslink-ng-linux-amd64.tar.gz" -o /tmp/xbslink-ng.tar.gz && \
    tar -xzf /tmp/xbslink-ng.tar.gz -C /tmp && \
    mv /tmp/xbslink-ng /usr/local/bin/xbslink-ng && \
    chmod +x /usr/local/bin/xbslink-ng && \
    rm /tmp/xbslink-ng.tar.gz

# Copy root filesystem
COPY rootfs /
