# https://developers.home-assistant.io/docs/add-ons/configuration#add-on-dockerfile
ARG BUILD_FROM
FROM ${BUILD_FROM}

# Copy xbslink-ng binary from official image
COPY --from=ghcr.io/jchadwick/xbslink-ng:latest /xbslink-ng /usr/local/bin/xbslink-ng

# Ensure binary is executable
RUN chmod +x /usr/local/bin/xbslink-ng

# Copy root filesystem
COPY rootfs /
