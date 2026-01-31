{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.shfmt";

  options = delib.singleEnableOption host.shellFeatured;

  home.ifEnabled.home.packages = with pkgs; [
    shfmt
  ];
}
