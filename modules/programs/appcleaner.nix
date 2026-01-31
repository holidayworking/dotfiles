{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.appcleaner";

  options = delib.singleEnableOption host.desktopFeatured;

  home.ifEnabled.home.packages = with pkgs; [
    brewCasks.appcleaner
  ];
}
