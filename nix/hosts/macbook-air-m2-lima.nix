{ inputs }:
let
  lib = import ../lib { inherit inputs; };
in
lib.mkNixosSystem {
  system = "aarch64-linux";
  hostname = "taurus";
  username = "hidekazu";
  stateVersion = "25.05";
  modules = [
    ./hardwares/vm-lima.nix
    ../profiles/nixos
    {
      services.openssh.enable = true;
      users.users."hidekazu".home = "/home/hidekazu.linux";
    }
  ];
}
