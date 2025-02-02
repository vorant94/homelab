{ pkgs, ... }:

let
  vars = import ./vars.nix;
  nanorc = import ./dotfiles/nanorc.template.nix { inherit pkgs; };
in {
  home = {
    username = vars.username;
    homeDirectory = "/home/${vars.username}";

    stateVersion = "24.11";

    
    file = {
      ".nanorc".text = nanorc;
    };
  };

  programs = {
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
  };
}
