{
  nixpkgs,
  home-manager,
  system,
  hostname,
  username,
  ...
}:
let
  pkgs = import nixpkgs {
    inherit system;
  };
in
{
  imports = [
    home-manager.nixosModules.home-manager
    ../common
  ];

  home-manager = {
    users."${username}" = {
      home = {
        packages = with pkgs; [
          gcc
        ];
      };
    };
  };

  networking.hostName = hostname;

  programs.nix-ld.enable = true;

  security.sudo.wheelNeedsPassword = false;

  services.tailscale.enable = true;

  time.timeZone = "Asia/Tokyo";

  users = {
    groups = {
      "${username}" = {
        gid = 1000;
      };
    };

    users = {
      root.hashedPassword = "!";

      "${username}" = {
        extraGroups = [
          "docker"
          "wheel"
        ];
        group = "${username}";
        isNormalUser = true;
        uid = 1000;
      };
    };
  };

  virtualisation.docker.enable = true;
}
