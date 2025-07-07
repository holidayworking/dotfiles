{ inputs }:
let
  inherit (inputs) nixpkgs nix-darwin home-manager;

  system = "aarch64-darwin";
  hostname = "aries";
  username = "hidekazu";
in
nix-darwin.lib.darwinSystem {
  modules = [
    ../profiles/darwin
    {
      home-manager.users."${username}".home.stateVersion = "25.05";
      system.stateVersion = 5;
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
}
