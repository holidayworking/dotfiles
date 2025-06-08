{
  pkgs,
  system,
  username,
}:
let
  dotfile = name: { source = ../../../dotfiles + "/${name}"; };
in
{
  home = import ./home { inherit dotfile pkgs username; };
  targets = import ./targets { inherit system; };
  xdg = import ./xdg { inherit dotfile; };

  programs.home-manager.enable = true;
}
