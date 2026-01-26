{
  config,
  ...
}:
{
  flake.modules =
    let
      stateVersion = "25.05";
      darwinStateVersion = 5;
    in
    {
      nixos.base = {
        system = {
          inherit stateVersion;
        };
      };

      darwin.base = {
        system = {
          defaults = {
            SoftwareUpdate.AutomaticallyInstallMacOSUpdates = true;
          };
          stateVersion = darwinStateVersion;
        };
      };

      homeManager.base = {
        home = {
          inherit stateVersion;
        };
      };
    };
}
