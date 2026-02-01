{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.firefox";

  options = delib.singleEnableOption host.desktopFeatured;

  home.ifEnabled.home.packages = with pkgs; [
    brewCasks.firefox
  ];
}
