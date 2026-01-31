{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.nixfmt";

  options = delib.singleEnableOption host.shellFeatured;

  home.ifEnabled.home.packages = with pkgs; [
    nixfmt
  ];
}
