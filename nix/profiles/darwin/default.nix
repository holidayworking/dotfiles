{
  nixpkgs,
  home-manager,
  system,
  hostname,
  username,
  ...
}:
{
  imports = [
    home-manager.darwinModules.home-manager
    ../common
    ./homebrew.nix
  ];

  home-manager = {
    users."${username}" = {
      home = {
        homeDirectory = nixpkgs.lib.mkForce "/Users/${username}/";
      };

      targets.darwin.defaults."com.apple.Safari" = {
        AutoFillPasswords = false;
        AutoOpenSafeDownloads = false;
        IncludeDevelopMenu = true;
      };
    };
  };

  security = {
    pam.services.sudo_local = {
      reattach = true;
      touchIdAuth = true;
    };
  };

  networking = {
    computerName = hostname;
    hostName = hostname;
  };

  system = {
    primaryUser = username;
    defaults = {
      SoftwareUpdate.AutomaticallyInstallMacOSUpdates = true;
      menuExtraClock.ShowSeconds = true;

      dock = {
        minimize-to-application = true;
        mru-spaces = false;
        show-recents = false;
        wvous-bl-corner = 4;
        wvous-br-corner = 5;
        wvous-tl-corner = 2;
        wvous-tr-corner = 3;
      };

      finder = {
        FXRemoveOldTrashItems = true;
        NewWindowTarget = "Home";
        ShowExternalHardDrivesOnDesktop = false;
        ShowRemovableMediaOnDesktop = false;
      };
    };
  };
}
