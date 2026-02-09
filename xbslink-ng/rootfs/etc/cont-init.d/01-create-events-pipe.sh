#!/usr/bin/with-contenv bashio
# ==============================================================================
# Create named pipe for event emission if MQTT is enabled and available
# ==============================================================================

PIPE_PATH="/run/xbslink-events.pipe"

# Clean up any stale pipe from a previous run
rm -f "${PIPE_PATH}"

# Only create the pipe if mqtt_enabled is true AND the MQTT service is available
if bashio::config.true 'mqtt_enabled' && bashio::services "mqtt"; then
    mkfifo "${PIPE_PATH}"
    bashio::log.info "Created events pipe at ${PIPE_PATH}"
else
    bashio::log.info "MQTT disabled or unavailable, skipping events pipe"
fi
