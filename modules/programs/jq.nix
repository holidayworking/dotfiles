{
  delib,
  host,
  ...
}:
delib.module {
  name = "programs.jq";

  options = delib.singleEnableOption host.shellFeatured;

  home.ifEnabled.programs.jq.enable = true;
}
