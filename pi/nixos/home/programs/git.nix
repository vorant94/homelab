let
  vars = import ../../shared/vars.nix;
in
{
  enable = true;

  userName = vars.username;
  userEmail = "vorant94@pm.me";

  aliases = {
    s = "status -sb";
    f = "fetch --all -p";
    l = "log --graph --decorate --pretty=oneline --abbrev-commit --all";
    d = "diff HEAD";
    r = "reset --hard HEAD";
    ca = "commit --amend --no-edit -a";
    pf = "push --force";
    wip = "!f() { git add . && git commit -m 'Work in progress'; }; f";
  };

  extraConfig = {
    init.defaultBranch = "master";
    push.autoSetupRemote = true;
    core.editor = "nano";
  };
}
