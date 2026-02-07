{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.firefox";

  options = delib.singleEnableOption host.isDesktop;

  home.ifEnabled.home.packages = with pkgs; [
    brewCasks.firefox
  ];
}
