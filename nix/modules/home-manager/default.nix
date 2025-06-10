{
  pkgs,
  system,
  username,
  ...
}:
let
  dotfile = name: { source = ../../../dotfiles + "/${name}"; };
in
{
  home = import ./home { inherit dotfile pkgs username; };
  programs = import ./programs { inherit pkgs username; };
  targets = import ./targets { inherit system; };
  xdg = import ./xdg { inherit dotfile; };
}
