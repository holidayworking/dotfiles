{ inputs }:
let
  inherit (inputs) nixpkgs disko home-manager;

  system = "aarch64-linux";
  hostname = "gemini";
  username = "hidekazu";

  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };
in
nixpkgs.lib.nixosSystem {
  modules = [
    disko.nixosModules.disko
    ./hardwares/vm-utm.nix
    ../roles/linux-desktop
    {
      home-manager.users."${username}".home.stateVersion = "25.05";

      users.users."${username}" = {
        extraGroups = [
          "networkmanager"
          "wheel"
        ];
        initialPassword = username;
        openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIL8Zoej4KoXnIYd9g2ocJXHyYAtNUlaSWtq84aIuAFhq"
        ];
      };
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
