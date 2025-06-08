{
  username,
}:
{
  primaryUser = username;
  stateVersion = 5;

  defaults = {
    SoftwareUpdate.AutomaticallyInstallMacOSUpdates = true;
    menuExtraClock.ShowSeconds = true;

    dock = {
      minimize-to-application = false;
      mru-spaces = false;
      show-recents = false;
      wvous-bl-corner = 4;
      wvous-br-corner = 5;
      wvous-tl-corner = 2;
      wvous-tr-corner = 3;
    };

    finder = {
      NewWindowTarget = "Home";
      ShowExternalHardDrivesOnDesktop = false;
      ShowRemovableMediaOnDesktop = false;
    };
  };
}
