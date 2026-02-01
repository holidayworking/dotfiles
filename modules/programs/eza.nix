{
  delib,
  host,
  ...
}:
delib.module {
  name = "programs.eza";

  options = delib.singleEnableOption host.shellFeatured;

  home.ifEnabled.programs.eza.enable = true;
}
