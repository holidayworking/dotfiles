{
  delib,
  host,
  ...
}:
delib.module {
  name = "programs.gh";

  options = delib.singleEnableOption host.shellFeatured;

  home.ifEnabled.programs.gh = {
    enable = true;
    settings.git_protocol = "ssh";
  };
}
