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
    ../../modules/darwin
    home-manager.darwinModules.home-manager
    {
      home-manager = {
        users."${username}" = pkgs.lib.mkMerge [
          ../../modules/home-manager
          {
            home.homeDirectory = pkgs.lib.mkForce "/Users/${username}/";
          }
        ];
        useGlobalPkgs = true;
        useUserPackages = true;
        extraSpecialArgs = { inherit pkgs system username; };
      };
    }
  ];
  specialArgs = { inherit system username; };
}
