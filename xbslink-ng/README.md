# Home Assistant Add-on: XBSLink-NG

## About

Connect two Xbox consoles over the internet for System Link gaming with the lowest possible latency. XBSLink-NG creates a direct peer-to-peer connection between you and your friend, bypassing centralized servers for optimal performance.

## Features

- ✅ Direct P2P connection for minimum latency
- ✅ Supports both listen and connect modes
- ✅ Pre-shared key authentication for security
- ✅ Real-time statistics and monitoring
- ✅ AppArmor security profile
- ✅ Multi-architecture support

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
