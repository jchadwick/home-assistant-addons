# https://developers.home-assistant.io/docs/add-ons/configuration#add-on-dockerfile
ARG BUILD_FROM
FROM ${BUILD_FROM}

# Install runtime dependencies
RUN apk add --no-cache libpcap curl mosquitto-clients

# Download prebuilt xbslink-ng binary
ARG XBSLINK_VERSION=v0.0.11
ARG BUILD_ARCH

# Map Home Assistant arch to release artifact arch
RUN case "${BUILD_ARCH}" in \
      "amd64") RELEASE_ARCH="amd64" ;; \
      "aarch64") RELEASE_ARCH="arm64" ;; \
      *) echo "Unsupported architecture: ${BUILD_ARCH}" && exit 1 ;; \
    esac && \
    echo "Downloading xbslink-ng ${XBSLINK_VERSION} for linux-${RELEASE_ARCH}..." && \
    curl -fsSL "https://github.com/jchadwick/xbslink-ng/releases/download/${XBSLINK_VERSION}/xbslink-ng-linux-${RELEASE_ARCH}.tar.gz" -o /tmp/xbslink-ng.tar.gz && \
    tar -xzf /tmp/xbslink-ng.tar.gz -C /tmp && \
    mv /tmp/xbslink-ng /usr/local/bin/xbslink-ng && \
    chmod +x /usr/local/bin/xbslink-ng && \
    rm -f /tmp/xbslink-ng.tar.gz

# Copy root filesystem
COPY rootfs /
