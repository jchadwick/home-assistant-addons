# Home Assistant Add-ons by jchadwick

Home Assistant add-ons for various services and integrations.

[![Open your Home Assistant instance and show the add add-on repository dialog with a specific repository URL pre-filled.](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Fjchadwick%2Fhome-assistant-addons)

## Add-ons

This repository contains the following add-ons:

### [XBSLink-NG](./xbslink-ng)

![Supports aarch64 Architecture][aarch64-shield]
![Supports amd64 Architecture][amd64-shield]
![Supports armhf Architecture][armhf-shield]
![Supports armv7 Architecture][armv7-shield]
![Supports i386 Architecture][i386-shield]

P2P bridge for Xbox System Link over the internet. Connect two Xbox consoles for local multiplayer gaming with low latency using a direct peer-to-peer connection.

## Installation

1. Click the button above or manually add this repository to your Home Assistant:
   - Navigate to **Supervisor → Add-on Store → ⋮ (menu) → Repositories**
   - Add: `https://github.com/jchadwick/home-assistant-addons`
2. Find the add-on you want to install
3. Click **Install**
4. Configure the add-on
5. Click **Start**

## XBSLink-NG Automation Blueprint

Use this automation blueprint to control the `xbslink-ng` add-on from entity state changes:
- Start XBSLink-NG when one entity enters a configured state
- Stop XBSLink-NG when another entity enters a configured state

[![Open your Home Assistant instance and import this blueprint](https://my.home-assistant.io/badges/blueprint_import.svg)](https://my.home-assistant.io/redirect/blueprint_import/?blueprint_url=https://raw.githubusercontent.com/jchadwick/home-assistant-addons/main/blueprints/automation/jchadwick/xbslink_ng_start_stop_on_entity_states.yaml)

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

## Support

If you have issues with a specific add-on, please open an issue on this repository with details about:
- Which add-on you're using
- Your Home Assistant version
- Log output showing the error
- Steps to reproduce

## Releasing Add-ons

Releases use auto-incrementing CalVer versioning (YYYY.MM.MICRO).

### Updating xbslink-ng to a New Binary Version

When a new [xbslink-ng binary release](https://github.com/jchadwick/xbslink-ng/releases) is published:

1. Edit `xbslink-ng/Dockerfile` and update `XBSLINK_VERSION=v0.0.X` to the new tag
2. Commit: `git commit -m "fix(xbslink-ng): update binary to v0.0.X"`
3. Push to `main`
4. CI automatically bumps the addon version and deploys to GHCR

### Manual Changes

For addon configuration, scripts, or other changes:

1. Make your changes to `xbslink-ng/` files
2. Commit with conventional commit message (e.g., `feat(xbslink-ng): add new option`)
3. Push to `main`
4. CI automatically bumps the version and deploys

The version in `config.yaml` is auto-updated by CI — no manual version changes needed.

## Contributing

Contributions are welcome! Please open a pull request with your changes.

## License

MIT License - See [LICENSE](LICENSE) for details.

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg
