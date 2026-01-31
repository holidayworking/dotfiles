{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.nh";

  options = delib.singleEnableOption host.shellFeatured;

  home.ifEnabled.programs.nh.enable = true;
}
