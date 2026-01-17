{
  flake.modules.darwin.desktop = {
    system = {
      defaults = {
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
  };
}
