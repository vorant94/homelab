{ config, pkgs, ... }:

let
  nanorc = import ./nanorc.nix { inherit pkgs; };
in {
  home = {
    username = "vorant94";
    homeDirectory = "/home/vorant94";

    stateVersion = "24.11";

    enableNixpkgsReleaseCheck = false;

    packages = [
      pkgs.nano
      pkgs.nanorc
      pkgs.tmux
      pkgs.git
      pkgs.fzf
    ];

    file = {
      ".nanorc".text = nanorc;
    };

    sessionVariables = {
      EDITOR = "nano";
    };
  };

  programs = {
    home-manager = {
      enable = true;
    };

    git = {
      enable = true;
      
      userName = "vorant94";
      userEmail = "vorant94@pm.me";

      extraConfig = {
        init.defaultBranch = "master";
        push.autoSetupRemote = true;
        core.editor = "nano";
      };
    };
  };
}
