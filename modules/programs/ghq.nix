{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.ghq";

  options = delib.singleEnableOption host.shellFeatured;

  home.ifEnabled.home.packages = with pkgs; [
    ghq
  ];
}
