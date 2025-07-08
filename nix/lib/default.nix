{ inputs }:
let
  inherit (inputs)
    nixpkgs
    nix-darwin
    home-manager
    disko
    ;
in
{
  mkDarwinSystem =
    {
      system,
      hostname,
      username,
      stateVersion,
      darwinStateVersion,
      modules,
    }:
    nix-darwin.lib.darwinSystem {
      modules = modules ++ [
        {
          home-manager.users."${username}".home.stateVersion = stateVersion;
          system.stateVersion = darwinStateVersion;
        }
      ];

      specialArgs = {
        inherit
          nixpkgs
          home-manager
          system
          hostname
          username
          ;
      };
    };

  mkNixosSystem =
    {
      system,
      hostname,
      username,
      stateVersion,
      modules,
    }:
    nixpkgs.lib.nixosSystem {
      modules =
        [ disko.nixosModules.disko ]
        ++ modules
        ++ [
          {
            home-manager.users."${username}".home.stateVersion = stateVersion;
          }
        ];

      specialArgs = {
        inherit
          nixpkgs
          home-manager
          system
          hostname
          username
          ;
      };
    };
}
