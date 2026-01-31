{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.slack";

  options = delib.singleEnableOption host.desktopFeatured;

  home.ifEnabled.home.packages = with pkgs; [
    brewCasks.slack
  ];
}
