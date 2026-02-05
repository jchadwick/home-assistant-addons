# https://developers.home-assistant.io/docs/add-ons/configuration#add-on-dockerfile
ARG BUILD_FROM
FROM ${BUILD_FROM}

# Install runtime dependencies
RUN apk add --no-cache libpcap curl

# Download and install xbslink-ng binary from GitHub release
ARG XBSLINK_VERSION=v0.0.1
RUN curl -L "https://github.com/jchadwick/xbslink-ng/releases/download/${XBSLINK_VERSION}/xbslink-ng-linux-amd64.tar.gz" | \
    tar -xzC /tmp && \
    mv /tmp/xbslink-ng /usr/local/bin/xbslink-ng && \
    chmod +x /usr/local/bin/xbslink-ng

# Copy root filesystem
COPY rootfs /
