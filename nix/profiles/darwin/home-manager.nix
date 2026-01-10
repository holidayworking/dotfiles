{
  pkgs,
  home-manager,
  username,
  ...
}:
{
  home-manager = {
    users."${username}" = {
      home = {
        homeDirectory = pkgs.lib.mkForce "/Users/${username}/";
      };

      targets.darwin.defaults."com.apple.Safari" = {
        AutoFillPasswords = false;
        AutoOpenSafeDownloads = false;
        IncludeDevelopMenu = true;
      };
    };
  };
}
