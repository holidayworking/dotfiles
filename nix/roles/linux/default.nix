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

  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = true;
  };

  system.stateVersion = "25.05";

  time.timeZone = "Asia/Tokyo";

  users.users = {
    "${username}" = {
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

    rosetta = {
      enable = true;
    };
  };
}
