{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.gnumake";

  options = delib.singleEnableOption host.shellFeatured;

  home.ifEnabled.home.packages = with pkgs; [
    gnumake
  ];
}
