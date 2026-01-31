{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.peco";

  options = delib.singleEnableOption host.shellFeatured;

  home.ifEnabled.home.packages = with pkgs; [
    peco
  ];
}
