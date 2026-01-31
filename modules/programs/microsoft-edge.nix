{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.microsoft-edge";

  options = delib.singleEnableOption host.desktopFeatured;

  home.ifEnabled.home.packages = with pkgs; [
    brewCasks.microsoft-edge
  ];
}
