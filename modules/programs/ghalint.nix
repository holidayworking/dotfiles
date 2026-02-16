{ delib, pkgs, ... }:
delib.module {
  name = "programs.ghalint";

  home.always.home.packages = with pkgs; [
    ghalint
  ];
}
