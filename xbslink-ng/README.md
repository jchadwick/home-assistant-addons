# Home Assistant Add-on: XBSLink-NG

## About

Connect two Xbox consoles over the internet for System Link gaming with the lowest possible latency. XBSLink-NG creates a direct peer-to-peer connection between you and your friend, bypassing centralized servers for optimal performance.

## Features

- ✅ Direct P2P connection for minimum latency
- ✅ Supports both listen and connect modes
- ✅ Pre-shared key authentication for security
- ✅ Real-time statistics and monitoring
- ✅ AppArmor security profile
- ✅ Multi-architecture support (amd64, aarch64)
- ✅ MQTT integration for Home Assistant sensors

## Prerequisites

- Xbox connected to the same network as Home Assistant
- One person must be able to port forward a UDP port
- Internet connection with <30ms latency between locations

## Installation

1. Add this repository to Home Assistant:
   - Navigate to Supervisor → Add-on Store → Menu (⋮) → Repositories
   - Add: `https://github.com/jchadwick/home-assistant-addons`
2. Find "XBSLink-NG" in the add-on store
3. Click Install
4. Configure the add-on (see Documentation tab)
5. Start the add-on

## Configuration

See the **Documentation** tab for detailed configuration instructions.

## Automation Blueprint

Use this automation blueprint to control the `xbslink-ng` add-on from entity state changes:
- Start XBSLink-NG when one entity enters a configured state
- Stop XBSLink-NG when another entity enters a configured state

[![Open your Home Assistant instance and import this blueprint](https://my.home-assistant.io/badges/blueprint_import.svg)](https://my.home-assistant.io/redirect/blueprint_import/?blueprint_url=https://raw.githubusercontent.com/jchadwick/home-assistant-addons/main/xbslink-ng/blueprints/automation/jchadwick/xbslink_ng_start_stop_on_entity_states.yaml)

### Install the Blueprint

1. Click the import badge above
2. In Home Assistant, review and import `XBSLink-NG - Start/Stop From Entity States`
3. Create an automation from the imported blueprint

### Configure the Blueprint

Set these inputs when creating the automation:
- `Start trigger entity`: the entity that should start XBSLink-NG
- `Start trigger state`: state value that should start XBSLink-NG (default: `on`)
- `Stop trigger entity`: the entity that should stop XBSLink-NG
- `Stop trigger state`: state value that should stop XBSLink-NG (default: `off`)

Example:
- Start entity: `binary_sensor.game_night`
- Start state: `on`
- Stop entity: `binary_sensor.game_night`
- Stop state: `off`

### Example Configuration (Listen Mode)

```yaml
mode: listen
interface: eth0
xbox_mac: "00:50:F2:AA:BB:CC"
port: 31415
key: "our_secret_key_123"
log_level: info
stats_interval: 30
```

### Example Configuration (Connect Mode)

```yaml
mode: connect
interface: eth0
xbox_mac: "00:50:F2:DD:EE:FF"
peer_address: "203.0.113.50:31415"
key: "our_secret_key_123"
log_level: info
stats_interval: 30
```

## Support

- [Report an issue](https://github.com/jchadwick/home-assistant-addons/issues)
- [XBSLink-NG project](https://github.com/jchadwick/xbslink-ng)

## License

MIT License - See [LICENSE](https://github.com/jchadwick/home-assistant-addons/blob/main/LICENSE)
