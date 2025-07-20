{ inputs }:
let
  lib = import ../lib { inherit inputs; };
in
lib.mkNixosSystem {
  system = "aarch64-linux";
  hostname = "gemini";
  username = "hidekazu";
  stateVersion = "25.05";
  modules = [
    ./hardwares/vm-utm.nix
    ../profiles/nixos-desktop
    {
      services = {
        openssh.enable = true;
        spice-vdagentd.enable = true;

        xserver.xkb = {
          layout = "us";
          variant = "mac";
        };
      };

      users.users."hidekazu" = {
        initialPassword = "hidekazu";
        openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIL8Zoej4KoXnIYd9g2ocJXHyYAtNUlaSWtq84aIuAFhq"
        ];
      };
    }
  ];
}
