{
  nixpkgs,
  home-manager,
  system,
  hostname,
  username,
  ...
}:
{
  imports = [
    home-manager.nixosModules.home-manager
    ../base
  ];

  networking.hostName = hostname;

  programs.nix-ld.enable = true;

  security.sudo.wheelNeedsPassword = false;

  services = {
    tailscale = {
      enable = true;
    };

    openssh = {
      enable = true;
      settings.PasswordAuthentication = true;
    };
  };

  system.stateVersion = "25.05";

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
        extraGroups = [ "wheel" ];
        group = "${username}";
        isNormalUser = true;
        openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIL8Zoej4KoXnIYd9g2ocJXHyYAtNUlaSWtq84aIuAFhq"
        ];
        uid = 1000;
      };
    };
  };

  virtualisation = {
    docker.enable = true;
    rosetta.enable = true;
  };
}
