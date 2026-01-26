{
  flake.modules = {
    darwin.base = {
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
      };
    };

    nixos.base = {
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
      };
    };

    homeManager.base =
      { config, pkgs, ... }:
      {
        home.homeDirectory = pkgs.lib.mkForce (
          if pkgs.stdenv.isDarwin then "/Users/${config.home.username}/" else "/home/${config.home.username}"
        );

        programs.home-manager.enable = true;

        targets.darwin = pkgs.lib.mkIf pkgs.stdenv.isDarwin {
          copyApps.enable = true;
          linkApps.enable = false;
        };
      };
  };
}
