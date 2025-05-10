# Start from scratch

## Setup OS

1. Install NixOS on a RPi with dummy password, [guide](https://nix.dev/tutorials/nixos/installing-nixos-on-a-raspberry-pi.html)
2. Copy SSH keys to a RPi
3. Generate `age` key form SSH keys, [guide](https://github.com/Mic92/ssh-to-age/blob/main/README.md)
4. Clone this repo
5. Create a symlink from `/etc/nixos` to this repo's `src` dir
6. Rebuild the system

## Setup Containers

1. Decrypt SSL-realted files with `decrypt.sh`
2. Put decrypted `pi.lan.key` into `docker/nginx/private`
3. Put decrypted `pi.lan.crt` into `docker/nginx/certs`
4. Update `docker/pihole/pihole/custom.list` with following content
    ```
      192.168.50.83   pi.lan
      192.168.50.83   vaultwarden.pi.lan
      192.168.50.83   jellyfin.pi.lan
      192.168.50.83   firefly.pi.lan
      192.168.50.83   freshrss.pi.lan
    ```
5. Run all the services

## Setup router

1. Set persistent IP address to RPi
2. Add RPi as custom DNS (Asus RT-AX55 has out-of-the-box support for it in it's settings)

# Add cert of client

## MacOS

1. Open Keychain Access
2. Go to `System->Certificates` tab
3. Go to `File->Import Items` in top bar
4. Select `ca.pem` from `ssl`
5. Double-click on newly added item
6. Expand `Trust` section
7. Change `When using this certificate` to `Always Trust`
8. Save the changes by closing the window (you'll be prompted for password)

## iOS

1. Send `ca.pem` to iPhone via AirDrop or any other way
2. Open `Settings` and select `Profile Downloaded`
3. Click `Install`, enter PIN and approve installation
4. Go to `Settings->General->About->Certificate Trust Settings` trust the certificate

# Stuff that requires backup / restore

1. SSH key of the machine
2. Whole PostgreSQL instance (via `pg_dumpall`)
3. Heimdall config (via its UI)
