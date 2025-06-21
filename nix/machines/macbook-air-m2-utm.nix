{ inputs }:
let
  inherit (inputs)
    nixpkgs
    disko
    home-manager
    ;

  system = "aarch64-linux";
  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };

  username = "hidekazu";
in
nixpkgs.lib.nixosSystem {
  modules = [
    disko.nixosModules.disko
    home-manager.nixosModules.home-manager
    ./hardwares/vm-utm.nix
    {
      home-manager = {
        users."${username}".imports = [
          ../modules/home-manager
        ];
        backupFileExtension = "backup";
        useGlobalPkgs = true;
        useUserPackages = true;
        extraSpecialArgs = { inherit pkgs system username; };
      };

      nix = {
        gc = {
          automatic = true;
          dates = "weekly";
          options = "--delete-older-than 7d";
        };
        optimise.automatic = true;
        settings = {
          experimental-features = [
            "flakes"
            "nix-command"
          ];
        };
      };

      nixpkgs.hostPlatform = system;

      networking.hostName = "taurus";

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
          openssh.authorizedKeys.keys = [
            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIL8Zoej4KoXnIYd9g2ocJXHyYAtNUlaSWtq84aIuAFhq"
          ];
          extraGroups = [ "wheel" ];
          isNormalUser = true;
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
        rosetta.enable = true;
      };
    }
  ];
}
