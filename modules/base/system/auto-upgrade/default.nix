{
  flake.modules.darwin.desktop = {
    system = {
      defaults = {
        SoftwareUpdate.AutomaticallyInstallMacOSUpdates = true;
      };
    };
  };
}
