{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.notion";

  options = delib.singleEnableOption host.desktopFeatured;

  home.ifEnabled.home.packages = with pkgs; [
    brewCasks.notion
  ];
}
