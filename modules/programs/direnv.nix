{
  delib,
  host,
  ...
}:
delib.module {
  name = "programs.direnv";

  options = delib.singleEnableOption host.shellFeatured;

  home.ifEnabled.programs.direnv.enable = true;
}
