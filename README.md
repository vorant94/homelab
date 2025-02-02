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
5. Install `git` via Nix
   - edit `~/.config/home-manager/home.nix` directly
6. Clone Homelab [repo](https://github.com/vorant94/homelab)
7. Replace default Home Manager folder with symlink to one in repo
   - example `ln -s ~/homelab/home-manager ~/.config/home-manager`
8. Authenticate GitHub user
   - adding SSH key to GitHub account -> [here](https://stackoverflow.com/questions/23546865/how-to-configure-command-line-git-to-use-ssh-key)
9. Install [Docker](https://docs.docker.com/engine/install/debian/)
   - enable using `docker` without `sudo`, [here](https://docs.docker.com/engine/install/linux-postinstall/

# Cheatsheet

- Check Raspberry Pi model
	- `cat /sys/firmware/devicetree/base/model`
	- current output: `Raspberry Pi 4 Model B Rev 1.4`
- Check Raspberry Pi OS architecture
	- `uname -m.`
	- current output: `aarch64`
