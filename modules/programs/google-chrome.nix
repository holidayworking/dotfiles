{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.google-chrome";

  options = delib.singleEnableOption host.isDesktop;

  home.ifEnabled.programs.chromium = {
    enable = true;
    package =
      if pkgs.stdenv.isDarwin then
        # Nixpkgs google-chrome is marked insecure (out of date), so on Darwin install via brew-nix instead.
        (pkgs.brewCasks.google-chrome.overrideAttrs (oldAttrs: {
          src = pkgs.fetchurl {
            url = builtins.head oldAttrs.src.urls;
            hash = "sha256-TS8Fd1ECrBxgWhxGYYvR2Y51WUU74PdeKhGE7XHFj90=";
          };
        }))
      else if pkgs.stdenv.hostPlatform.system == "x86_64-linux" then
        pkgs.google-chrome
      else
        pkgs.chromium;
  };
}
