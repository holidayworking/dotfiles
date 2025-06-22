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
    home-manager.nixosModules.home-manager
    ./hardwares/vm-utm.nix
    ../roles/base
    {
      home-manager = {
        users."${username}" = {
          home = {
            stateVersion = "25.05";
          };
        };
      };

      networking.hostName = hostname;

      programs.nix-ld.enable = true;

      security.sudo.wheelNeedsPassword = false;

      services.openssh = {
        enable = true;
        settings.PasswordAuthentication = true;
      };

      system.stateVersion = "25.05";

      time.timeZone = "Asia/Tokyo";

      users.users = {
        hidekazu = {
          extraGroups = [ "wheel" ];
          isNormalUser = true;
          openssh.authorizedKeys.keys = [
            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIL8Zoej4KoXnIYd9g2ocJXHyYAtNUlaSWtq84aIuAFhq"
          ];
        };

        root.hashedPassword = "!";
      };

      virtualisation = {
        docker = {
          enable = true;
          rootless = {
            enable = true;
            setSocketVariable = true;
          };
        };

        rosetta = {
          enable = true;
        };
      };
    }
  ];
  specialArgs = {
    inherit nixpkgs system username;
  };
}
