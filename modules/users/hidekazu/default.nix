{
  flake = {
    meta.users = {
      hidekazu = {
        username = "hidekazu";
        authorizedKeys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIL8Zoej4KoXnIYd9g2ocJXHyYAtNUlaSWtq84aIuAFhq"
        ];
      };
    };

    modules.nixos.hidekazu = {
      users = {
        groups.hidekazu = {
          gid = 1000;
        };

        users.hidekazu = {
          extraGroups = [
            "docker"
            "wheel"
          ];
          group = "hidekazu";
          isNormalUser = true;
          uid = 1000;
        };
      };
    };
  };
}
