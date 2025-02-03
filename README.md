# Start from scratch

1. Install NixOS on a RPi with dummy password, [guide](https://nix.dev/tutorials/nixos/installing-nixos-on-a-raspberry-pi.html)
2. Copy SSH keys to a RPi
3. Generate `age` key form SSH keys, [guide](https://github.com/Mic92/ssh-to-age/blob/main/README.md)
4. Clone this repo
5. Create a symlink from `/etc/nixos` to this repo's `src` dir
6. Rebuild the system
