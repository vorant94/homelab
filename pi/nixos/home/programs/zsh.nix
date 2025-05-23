{
  enable = true;

  enableCompletion = true;
  syntaxHighlighting.enable = true;
  autosuggestion.enable = true;

  sessionVariables = {
    FZF_CTRL_T_COMMAND = "$FZF_DEFAULT_COMMAND";
  };

  oh-my-zsh.enable = true;
  oh-my-zsh.theme = "dracula";
  oh-my-zsh.custom = "$HOME/.config/oh-my-zsh";

  initExtra = ''
    precmd() { precmd() { echo "" } }
    fastfetch
  '';
}
