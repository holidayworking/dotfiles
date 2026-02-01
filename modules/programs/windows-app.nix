{
  delib,
  host,
  ...
}:
delib.module {
  name = "programs.windows-app";

  options = delib.singleEnableOption host.desktopFeatured;

  darwin.ifEnabled.homebrew.casks = [
    "windows-app"
  ];
}
