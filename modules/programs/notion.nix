{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.notion";

  options = delib.singleEnableOption host.isDesktop;

  home.ifEnabled.home.packages = with pkgs; [
    brewCasks.notion
  ];
}
