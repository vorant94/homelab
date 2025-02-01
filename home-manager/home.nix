{ config, pkgs, ... }:

let
  vars = import ./vars.nix;
  nanorc = import ./dotfiles/nanorc.template.nix { inherit pkgs; };
in {
  home = {
    username = vars.username;
    homeDirectory = "/home/${vars.username}";

    stateVersion = "24.11";

    enableNixpkgsReleaseCheck = false;

    packages = [
      pkgs.nano
      pkgs.nanorc
      pkgs.tmux
      pkgs.git
      pkgs.fzf
      pkgs.neofetch
      pkgs.zsh
    ];

    file = {
      ".nanorc".text = nanorc;
    };
  };

  programs = {
    home-manager = {
      enable = true;
    };

    git = {
      enable = true;
      
      userName = vars.username;
      userEmail = "vorant94@pm.me";

      extraConfig = {
        init.defaultBranch = "master";
        push.autoSetupRemote = true;
        core.editor = "nano";
      };
    };

    ssh = {
      enable = true;

      extraConfig = ''
        Host github.com
          User ${vars.username}
          IdentityFile ~/.ssh/id_ed25519
      '';
    };

    zsh = {
      enable = true;

      enableCompletion = true;
    };
  };
}
