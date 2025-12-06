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
    ./hardwares/vm-parallels.nix
    ../profiles/nixos-desktop
    {
      environment.sessionVariables = {
        PATH = [ "$HOME/.local/share/aquaproj-aqua/bin" ];
      };

      services = {
        openssh.enable = true;

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
