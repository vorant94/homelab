{ pkgs }:

{
  enable = true;

  baseIndex = 1;
  keyMode = "vi";

  plugins = with pkgs; [
    tmuxPlugins.sensible
    tmuxPlugins.resurrect
    {
      plugin = tmuxPlugins.continuum;

      extraConfig = ''
        set -g @continuum-save-interval '5'
        set -g @continuum-restore 'on'
      '';
    }
  ];
}
