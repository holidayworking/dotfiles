{ inputs }:
let
  inherit (inputs) nixpkgs disko home-manager;

  system = "aarch64-linux";
  hostname = "cancer";
  username = "hidekazu";
in
nixpkgs.lib.nixosSystem {
  modules = [
    disko.nixosModules.disko
    ./hardwares/vm-utm.nix
    ../roles/linux
    {
      home-manager.users."${username}".home.stateVersion = "25.05";
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
