{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:

let
  vars = import ./shared/vars.nix;
in
{
  boot = {
    kernelPackages = pkgs.linuxKernel.packages.linux_rpi4;
    initrd.availableKernelModules = [
      "xhci_pci"
      "usbhid"
      "usb_storage"
    ];
    loader = {
      grub.enable = false;
      generic-extlinux-compatible.enable = true;
      systemd-boot.configurationLimit = 10;
    };
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/NIXOS_SD";
      fsType = "ext4";
      options = [ "noatime" ];
    };

    "/home/${vars.username}/ssd" = {
      device = "/dev/sda1";
      fsType = "ext4";
      options = [
        "defaults"
        "nofail"
      ];
    };
  };

  services.samba = {
    enable = true;

    openFirewall = true;

    settings = {
      global = {
        "server string" = "smbnix";
        "netbios name" = "smbnix";
        "security" = "user";
        "guest account" = vars.username;
        "map to guest" = "bad user";
      };

      "public" = {
        "path" = "/home/${vars.username}/ssd/shared";
        "browseable" = "yes";
        "read only" = "no";
        "guest ok" = "yes";
        "create mask" = "0644";
        "directory mask" = "0755";
      };
    };
  };

  services.samba-wsdd = {
    enable = true;
    openFirewall = true;
  };

  networking = {
    hostName = vars.hostname;

    firewall.enable = true;
    firewall.allowPing = true;
  };

  sops = {
    defaultSopsFile = ./shared/secrets.yaml;
    age.keyFile = "/home/${vars.username}/.config/sops/age/keys.txt";

    secrets.password = {
      neededForUsers = true;
    };
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nix.optimise.automatic = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 1w";
  };

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
    fd
    nixfmt-rfc-style
    bat
    tmuxPlugins.continuum
    postgresql_16
    ghostty.terminfo
    starship
  ];

  virtualisation.docker.enable = true;

  services.openssh.enable = true;

  programs.zsh.enable = true;
  programs.fzf.keybindings = true;

  users = {
    mutableUsers = false;
    defaultUserShell = pkgs.zsh;

    users."${vars.username}" = {
      isNormalUser = true;
      hashedPasswordFile = config.sops.secrets.password.path;
      extraGroups = [
        "wheel"
        "docker"
      ];

      openssh.authorizedKeys.keyFiles = [
        ./home/authorized-keys/personal-mac.txt
        ./home/authorized-keys/lightricks-mac.txt
      ];
    };
  };

  hardware.enableRedistributableFirmware = true;
  system.stateVersion = "23.11";
}
