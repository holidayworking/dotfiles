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
    ../common
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

  virtualisation = {
    docker.enable = true;
    rosetta.enable = true;
  };
}
