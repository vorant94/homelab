{ config, pkgs, inputs, lib, ... }:

let
  vars = import ./vars.nix;
in {

  boot = {
    kernelPackages = pkgs.linuxKernel.packages.linux_rpi4;
    initrd.availableKernelModules = [ "xhci_pci" "usbhid" "usb_storage" ];
    loader = {
      grub.enable = false;
      generic-extlinux-compatible.enable = true;
    };
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/NIXOS_SD";
      fsType = "ext4";
      options = [ "noatime" ];
    };
  };

  networking = {
    hostName = vars.hostname;
  };

  sops = {
    defaultSopsFile = ./secrets/secrets.yaml;
    age.keyFile = "/home/${vars.username}/.config/sops/age/keys.txt";

    secrets.password = {
      neededForUsers = true;
    };
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  environment.pathsToLink = [ "/share/zsh" ];

  environment.systemPackages = with pkgs; [
    git
    vim
    wget
    ssh-to-age
    sops
    tmux
    fastfetch
    fzf
    zsh
  ];

  services.openssh.enable = true;

  programs.zsh.enable = true;

  users = {
    mutableUsers = false;
    defaultUserShell = pkgs.zsh;

    users."${vars.username}" = {
      isNormalUser = true;
      hashedPasswordFile = config.sops.secrets.password.path;
      extraGroups = [ "wheel" ];

      openssh.authorizedKeys.keyFiles = [
        ./authorized-keys/personal-mac.txt
        ./authorized-keys/lightricks-mac.txt
      ];
    };
  };

  hardware.enableRedistributableFirmware = true;
  system.stateVersion = "23.11";
}
