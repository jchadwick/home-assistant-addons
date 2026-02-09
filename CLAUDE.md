# Home Assistant Addons

Currently contains a single addon: `xbslink-ng/`

## xbslink-ng Addon

P2P bridge for Xbox System Link traffic, packaged as a Home Assistant addon.

### Structure

- `xbslink-ng/config.yaml` - Addon metadata (version, options, schema)
- `xbslink-ng/Dockerfile` - Downloads prebuilt Go binary from GitHub releases
- `xbslink-ng/rootfs/` - Runtime filesystem overlay
  - `etc/cont-init.d/` - s6-overlay init scripts (run once at startup)
  - `etc/services.d/` - s6-overlay services (long-running processes)
    - `xbslink-ng/run` - Main bridge service
    - `xbslink-mqtt/run` - MQTT sidecar (reads FIFO events, publishes to HA)

### Tech Stack

- s6-overlay service management
- bashio for addon config parsing
- Alpine Linux base
- Depends on prebuilt Go binary from `jchadwick/xbslink-ng` releases

### Event Flow

```
Go Binary (xbslink-ng)
    ↓ (JSON Lines via FIFO)
/run/xbslink-events.pipe
    ↓ (bash sed parsing)
MQTT Sidecar (xbslink-mqtt)
    ↓ (mosquitto_pub)
Home Assistant MQTT Discovery
```

Event types: `state_changed`, `stats`, `latency`, `discovery`, `error`

## Releasing

Releases use auto-incrementing CalVer (YYYY.MM.MICRO).

### Updating to a New Go Binary Version

1. Edit `xbslink-ng/Dockerfile` and change `XBSLINK_VERSION=v0.0.X` to the new tag
2. Commit: `git commit -m "fix(xbslink-ng): update binary to v0.0.X"`
3. Push to `main`
4. CI automatically:
   - Lints and builds test images
   - On success, bumps CalVer version in `config.yaml`
   - Builds multi-arch images (amd64, aarch64)
   - Pushes to GHCR (`ghcr.io/jchadwick/{arch}-addon-xbslink-ng`)

### Manual Changes (Features/Fixes)

1. Make your changes to `rootfs/`, `config.yaml`, etc.
2. Commit with conventional commit message (e.g., `feat(xbslink-ng): add new option`)
3. Push to `main`
4. Same CI flow as above — auto-bumps CalVer and deploys

### Version Scheme

- **CalVer**: `YYYY.MM.MICRO` (e.g., `2026.2.6`)
- Auto-increments `MICRO` within the same month
- Resets to `MICRO=0` on month rollover

### CI Workflows

- `.github/workflows/ci.yaml` - Lint + build on all pushes
- `.github/workflows/release.yaml` - Auto-version + deploy on main (after CI success)
