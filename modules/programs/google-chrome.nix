{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.google-chrome";

  options = delib.singleEnableOption host.desktopFeatured;

  home.ifEnabled.programs.chromium = {
    enable = true;
    package = pkgs.brewCasks.google-chrome.overrideAttrs (oldAttrs: {
      src = pkgs.fetchurl {
        url = builtins.head oldAttrs.src.urls;
        hash = "sha256-+1bfrMyoEnKTYUOpx19c20AAY/cOTN118wW9syu2IAE=";
      };
    });
  };
}
