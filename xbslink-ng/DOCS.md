# Home Assistant Add-on: XBSLink-NG

Connect two Xbox 360 consoles over the internet for System Link gaming with low latency.

## About

XBSLink-NG is a lightweight P2P bridge that tunnels Xbox 360 System Link traffic between two locations over the internet. Unlike services like XLink Kai, this creates a **direct peer-to-peer connection** between you and your friend, giving you the lowest possible latency.

## Prerequisites

- Xbox 360 connected to the same network as your Home Assistant instance
- One person must be able to **port forward** a UDP port through their router
- Internet connection with <30ms latency between locations (Xbox 360 requirement)

## Installation

1. Add this repository to your Home Assistant Supervisor
2. Install the "XBSLink-NG" add-on
3. Configure the add-on (see Configuration section)
4. Start the add-on

## Configuration

### Finding Your Network Interface

To find which interface your Xbox is connected to, you can check your Home Assistant network settings or use SSH/Terminal to run:

```bash
ip addr show
```

Common interface names:
- `eth0` - First Ethernet port
- `eth1` - Second Ethernet port
- `wlan0` - WiFi adapter
- `enp3s0` - PCI Ethernet (newer naming)

### Finding Your Xbox MAC Address

On Xbox 360:
1. Go to Settings → System → Network Settings
2. Select Configure Network
3. Choose Additional Settings → Advanced Settings
4. Note the "MAC Address" shown

Alternatively, check your router's DHCP client list for the Xbox's MAC address.

### Configuration Options

#### mode (required)

- **listen**: Your Home Assistant will wait for incoming connections (requires port forwarding)
- **connect**: Your Home Assistant will connect to a peer who is listening

#### interface (required)

The network interface name where your Xbox is connected (e.g., `eth0`, `eth1`, `wlan0`).

#### xbox_mac (required)

Your Xbox 360's MAC address in XX:XX:XX:XX:XX:XX format (e.g., `00:50:F2:1A:2B:3C`).

#### key (optional but strongly recommended)

A pre-shared secret key that both sides must use. This authenticates the connection and prevents unauthorized access to your LAN.

**Security Warning:** Without a key, anyone who discovers your port can inject packets into your network!

#### log_level (optional, default: info)

Logging verbosity: `error`, `warn`, `info`, `debug`, or `trace`.

Use `debug` or `trace` if you're troubleshooting connection issues.

#### stats_interval (optional, default: 30)

How often (in seconds) to print statistics to the log. Set to `0` to disable.

#### port (required for listen mode)

UDP port to listen on (e.g., `31415`). You must forward this port through your router to your Home Assistant's IP address.

#### peer_address (required for connect mode)

The peer's public IP address and port in the format `IP:PORT` (e.g., `203.0.113.50:31415`).

## Usage Example

### Setup for Two Friends

**Person A** (has port forwarding):

1. Forward UDP port 31415 on router to Home Assistant IP
2. Configure addon:
   ```yaml
   mode: listen
   interface: eth0
   xbox_mac: "00:50:F2:AA:BB:CC"
   port: 31415
   key: "our_secret_key_123"
   ```

**Person B**:

1. Get Person A's public IP address (they can check at https://whatismyipaddress.com)
2. Configure addon:
   ```yaml
   mode: connect
   interface: eth0
   xbox_mac: "00:50:F2:DD:EE:FF"
   peer_address: "203.0.113.50:31415"
   key: "our_secret_key_123"
   ```

### Testing the Connection

1. Start both add-ons
2. Check the logs - you should see "Bridge active! Forwarding packets..."
3. Start a System Link game on both Xboxes
4. The Xboxes should discover each other!

## Troubleshooting

### Logs show "waiting for peer connection"

**Listener side:**
- Ensure your router is forwarding the UDP port to your Home Assistant IP
- Check that your firewall isn't blocking the port
- Verify you're using the correct interface

**Connect side:**
- Verify the peer's IP address and port are correct
- Ensure both sides are using the same `key`

### Xboxes don't see each other

1. Check logs on both sides show "Bridge active"
2. Verify Xbox MAC addresses are correct
3. Ensure both Xboxes are on the same game/version
4. Set `log_level: debug` to see if packets are being captured

### High latency or disconnections

- Xbox 360 requires <30ms round-trip time
- Check your internet connection speed
- Try switching who does port forwarding (routing may be asymmetric)
- Close bandwidth-heavy applications
- Consider reducing Xbox MTU to 1400 in Network Settings

### Permission errors in logs

The add-on requires `NET_RAW` and `NET_ADMIN` capabilities - these should be enabled automatically. If you see permission errors, check your Home Assistant Supervisor settings.

## Support

For issues specific to:
- **This add-on**: Open an issue on the [add-on repository](https://github.com/jchadwick/home-assistant-addons)
- **XBSLink-NG itself**: See the [main project](https://github.com/jchadwick/xbslink-ng)

## Credits

- [XBSLink-NG](https://github.com/jchadwick/xbslink-ng) - The underlying bridge software
- Inspired by [XBSlink](https://www.seuffert.biz/xbslink/) and [XLink Kai](https://www.teamxlink.co.uk/)
