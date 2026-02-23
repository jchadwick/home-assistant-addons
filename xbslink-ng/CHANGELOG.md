# Changelog

All notable changes to this add-on will be documented in this file.

Versioning follows CalVer (YYYY.MM.MICRO).

## [2026.2.13] - 2026-02-23

### Fixed
- CI/release build failure due to glibc-linked prebuilt binary expecting incompatible libc/libpcap ABI on Alpine
- Docker image now builds `xbslink-ng` from source at the pinned tag, ensuring correct musl/libpcap linkage on all addon architectures

## [2026.2.12] - 2026-02-23

### Fixed
- Added `libc6-compat` to runtime dependencies so glibc-linked `xbslink-ng` binaries launch correctly on Alpine
- Added a Docker build-time startup check (`xbslink-ng --help`) to fail fast on incompatible binary/runtime combinations

## [2026.2.11] - 2026-02-19

### Changed
- Auto-deployed from main branch


## [2026.2.10] - 2026-02-19

### Changed
- Auto-deployed from main branch

## [2026.2.9] - 2026-02-19

### Changed
- Auto-deployed from main branch


## [2026.2.8] - 2026-02-09

### Changed
- Auto-deployed from main branch


## [2026.2.7] - 2026-02-09

### Changed
- Auto-deployed from main branch


## [2026.2.6] - 2026-02-09

### Fixed
- AppArmor child profile missing `/data/` and `/run/xbslink-events.pipe` write access, causing "permission denied" for the Go binary
- Removed ineffective `chmod 666` on FIFO pipe (AppArmor MAC overrides POSIX DAC)


## [2026.2.5] - 2026-02-09

### Changed
- Auto-deployed from main branch


## [2026.2.4] - 2026-02-09

### Changed
- Auto-deployed from main branch


## [2026.2.3] - 2026-02-09

### Changed
- Auto-deployed from main branch


## [2026.2.2] - 2026-02-09

### Changed
- Auto-deployed from main branch


## [2026.2.1] - 2026-02-09

### Changed
- Auto-deployed from main branch


## [2026.2.0] - 2026-02-09

### Added
- MQTT integration for native Home Assistant sensor entities
  - Connection status binary sensor
  - Current and average RTT sensors
  - TX/RX packet and byte counters
  - Auto-discovery via MQTT (requires Mosquitto broker)
  - Optional, enabled via `mqtt_enabled: true`
- Event emission system via named FIFO pipe
- MQTT sidecar service for bridging events to Home Assistant

### Changed
- Switched to CalVer versioning (YYYY.MM.MICRO)
- All references to "Xbox 360" replaced with "Xbox" (supports all Xbox models)
- Requires xbslink-ng binary v0.0.3+ with --events-output support

## [0.0.4] - 2026-02-08

### Changed
- Decoupled addon versioning from binary versioning
- Binary version pinned to v0.0.2 in Dockerfile

## [0.0.3] - 2026-02-07

### Added
- Pre-flight checks for network configuration
- Crash diagnostics and improved error messages

## [0.0.2] - 2026-02-06

### Changed
- Upgraded Alpine base to 3.15
- Dockerfile cleanup

## [0.0.1] - 2026-02-05

### Added
- Initial release of XBSLink-NG Home Assistant add-on
- Support for both listen and connect modes
- Dynamic configuration based on connection mode
- Network interface selection
- Xbox MAC address configuration
- Pre-shared key authentication (optional)
- Configurable log levels
- Adjustable statistics interval
- AppArmor security profile
- Multi-architecture support (amd64, aarch64, armhf, armv7, i386)
- Comprehensive documentation and troubleshooting guide
