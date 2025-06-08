{ inputs }:
let
  inherit (inputs) nix-darwin home-manager nixpkgs;

  system = "aarch64-darwin";
  pkgs = import nixpkgs { inherit system; };

  username = "hidekazu";
  configuration =
    { ... }:
    {
      networking.hostName = "jasper";
    };
in
nix-darwin.lib.darwinSystem {
  modules = [
    configuration
    (import ../../modules/darwin {
      inherit
        system
        username
        ;
    })
    home-manager.darwinModules.home-manager
    {
      home-manager = {
        users."${username}" = pkgs.lib.mkMerge [
          (import ../../modules/home-manager { inherit pkgs system username; })
          {
            home.homeDirectory = pkgs.lib.mkForce "/Users/${username}/";
          }
        ];
        useGlobalPkgs = true;
        useUserPackages = true;
      };
    }
  ];
}
