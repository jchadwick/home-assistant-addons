# https://developers.home-assistant.io/docs/add-ons/configuration#add-on-dockerfile
ARG BUILD_FROM
FROM ${BUILD_FROM}

# Install runtime dependencies
RUN apk add --no-cache libpcap curl

# Download and install xbslink-ng binary from GitHub release
ARG XBSLINK_VERSION=v0.0.1
RUN set -x && \
    curl -fsSL "https://github.com/jchadwick/xbslink-ng/releases/download/${XBSLINK_VERSION}/xbslink-ng-linux-amd64.tar.gz" -o /tmp/xbslink-ng.tar.gz && \
    tar -xzf /tmp/xbslink-ng.tar.gz -C /tmp && \
    ls -la /tmp/xbslink-ng && \
    mv /tmp/xbslink-ng /usr/local/bin/xbslink-ng && \
    chmod +x /usr/local/bin/xbslink-ng && \
    rm /tmp/xbslink-ng.tar.gz && \
    /usr/local/bin/xbslink-ng --version || /usr/local/bin/xbslink-ng help || echo "Binary installed at /usr/local/bin/xbslink-ng"

# Copy root filesystem
COPY rootfs /
