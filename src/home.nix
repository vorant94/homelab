{ pkgs, ... }:

let
  vars = import ./vars.nix;
  nanorc = import ./dotfiles/.nanorc.template.nix { inherit pkgs; };
in {

  home.username = vars.username;
  home.homeDirectory = "/home/${vars.username}";

  home.stateVersion = "24.11";

  home.file = {
    ".nanorc".text = nanorc;
    ".hushlogin".source = ./dotfiles/.hushlogin;
    ".config/oh-my-zsh" = {
      source = ./dotfiles/oh-my-zsh;
      recursive = true;
    };
  };

  programs.git = {
    enable = true;

    userName = vars.username;
    userEmail = "vorant94@pm.me";

    extraConfig = {
      init.defaultBranch = "master";
      push.autoSetupRemote = true;
      core.editor = "nano";
    };
  };

  programs.ssh = {
    enable = true;

    extraConfig = ''
      Host github.com
        User ${vars.username}
    '';
  };

  programs.zsh = {
    enable = true;

    enableCompletion = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh.enable = true;
    oh-my-zsh.theme = "robbyrussell";
    oh-my-zsh.custom = "$HOME/.config/oh-my-zsh";

    initExtra = ''
      fastfetch
    '';
  };
}
