{
  flake.modules.homeManager.desktop = {
    targets.darwin = {
      defaults."com.apple.Safari" = {
        AutoFillPasswords = false;
        AutoOpenSafeDownloads = false;
        IncludeDevelopMenu = true;
      };
    };
  };
}
