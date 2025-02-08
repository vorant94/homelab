{ pkgs, ... }:

let
  vars = import ../shared/vars.nix;
in
{
  home.username = vars.username;
  home.homeDirectory = "/home/${vars.username}";

  home.stateVersion = "24.11";

  home.file = {
    ".nanorc".text = import ./dotfiles/.nanorc.template.nix { inherit pkgs; };
    ".hushlogin".source = ./dotfiles/.hushlogin;
    ".config/oh-my-zsh" = {
      source = ./dotfiles/oh-my-zsh;
      recursive = true;
    };
  };

  programs.git = import ./programs/git.nix;
  programs.ssh = import ./programs/ssh.nix;
  programs.zsh = import ./programs/zsh.nix;
  programs.fzf = import ./programs/fzf.nix;
}
