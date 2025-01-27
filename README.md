# Start from scratch

1. Install Raspberry Pi OS Lite on a MicroSD with [Raspberry Pi Imager](https://www.raspberrypi.com/software/)
   - Raspberry Pi Imager is also available on [Homebrew](https://formulae.brew.sh/cask/raspberry-pi-imager)
   - enable access via SSH during installation
2. SSH into Raspberry Pi
3. Install [Nix Package Manager](https://nixos.org/download/#download-nix)
   - go with multi-user installation
   - run `nix-channel --update` to fix `warning: Nix search path entry '/home/vorant94/.nix-defexpr/channels' does not exist, ignoring`, [source](https://github.com/NixOS/nixpkgs/issues/40165)
4. Install [Home Manager](https://nix-community.github.io/home-manager/index.xhtml#sec-install-standalone)
   - choose latest stable channel (like 24.11)

# Cheatsheet

- Check Raspberry Pi model
	- `cat /sys/firmware/devicetree/base/model`
	- current output: `Raspberry Pi 4 Model B Rev 1.4`
- Check Raspberry Pi OS architecture
	- `uname -m.`
	- current output: `aarch64`
