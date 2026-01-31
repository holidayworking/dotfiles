{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.shellcheck";

  options = delib.singleEnableOption host.shellFeatured;

  home.ifEnabled.home.packages = with pkgs; [
    shellcheck
  ];
}
