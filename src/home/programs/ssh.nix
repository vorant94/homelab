let
  vars = import ../../shared/vars.nix;
in
{
  enable = true;

  extraConfig = ''
    Host github.com
      User ${vars.username}
  '';
}
