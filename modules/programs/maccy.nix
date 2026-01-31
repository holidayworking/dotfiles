{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.maccy";

  options = delib.singleEnableOption host.desktopFeatured;

  home.ifEnabled.home.packages = with pkgs; [
    brewCasks.maccy
  ];
}
