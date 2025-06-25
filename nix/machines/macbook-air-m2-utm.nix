{ inputs }:
let
  inherit (inputs) nixpkgs disko home-manager;

  system = "aarch64-linux";
  hostname = "taurus";
  username = "hidekazu";
in
nixpkgs.lib.nixosSystem {
  modules = [
    disko.nixosModules.disko
    ./hardwares/vm-utm.nix
    ../roles/linux
    {
      home-manager.users."${username}".home.stateVersion = "25.05";

      users.users."${username}".openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIL8Zoej4KoXnIYd9g2ocJXHyYAtNUlaSWtq84aIuAFhq"
      ];
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
