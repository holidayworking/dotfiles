{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.google-chrome";

  options = delib.singleEnableOption host.isDesktop;

  # Nixpkgs google-chrome is marked insecure (out of date), so install via brew-nix instead.
  home.ifEnabled.programs.chromium = {
    enable = true;
    package = pkgs.brewCasks.google-chrome.overrideAttrs (oldAttrs: {
      src = pkgs.fetchurl {
        url = builtins.head oldAttrs.src.urls;
        hash = "sha256-IOqACKlFjzjY+KIi3NuFLp/z9fIfmz+097RYpdAWTxI=";
      };
    });
  };
}
