{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.proto";

  options = delib.singleEnableOption host.shellFeatured;

  home.ifEnabled.home.packages = with pkgs; [
    proto
  ];
}
