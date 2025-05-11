{ pkgs }:

''
  include "${pkgs.nanorc}/share/*.nanorc"

  set autoindent
  set linenumbers
  set tabsize 2
  set tabstospaces
''
