{
  enable = true;

  enableCompletion = true;
  syntaxHighlighting.enable = true;

  sessionVariables = {
    FZF_CTRL_T_COMMAND = "$FZF_DEFAULT_COMMAND";
  };

  shellAliases = {
    la = "ls -lAFh";
    c = "clear";
    r = "source ~/.zshrc";
    ".." = "cd ..";
  };

  oh-my-zsh.enable = true;
  oh-my-zsh.theme = "dracula";
  oh-my-zsh.custom = "$HOME/.config/oh-my-zsh";

  initExtra = ''
    fastfetch
  '';
}
