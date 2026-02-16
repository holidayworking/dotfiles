{ delib, pkgs, ... }:
delib.module {
  name = "programs.pinact";

  home.always.home.packages = with pkgs; [
    pinact
  ];
}
