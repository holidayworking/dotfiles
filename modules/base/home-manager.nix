{
  flake.modules = {
    darwin.base = {
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
      };
    };

    homeManager.base =
      { config, pkgs, ... }:
      {
        home.homeDirectory = pkgs.lib.mkForce "/Users/${config.home.username}/";
        programs.home-manager.enable = true;

        targets.darwin = {
          copyApps.enable = true;
          linkApps.enable = false;
        };
      };
  };
}
