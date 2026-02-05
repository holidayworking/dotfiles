{ delib, host, ... }:
delib.module {
  name = "programs.parallels";

  options = delib.singleEnableOption host.desktopFeatured;

  darwin.ifEnabled.homebrew.casks = [
    "parallels"
  ];
}
