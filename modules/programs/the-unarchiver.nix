{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.the-unarchiver";

  options = delib.singleEnableOption host.desktopFeatured;

  home.ifEnabled.home.packages = with pkgs; [
    brewCasks.the-unarchiver
  ];
}
