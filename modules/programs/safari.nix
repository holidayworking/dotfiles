{ delib, host, ... }:
delib.module {
  name = "programs.safari";

  options = delib.singleEnableOption host.desktopFeatured;

  home.ifEnabled.targets.darwin = {
    defaults."com.apple.Safari" = {
      AutoFillPasswords = false;
      AutoOpenSafeDownloads = false;
      IncludeDevelopMenu = true;
    };
  };
}
