{ inputs }:
let
  lib = import ../lib { inherit inputs; };
in
lib.mkNixosSystem {
  system = "aarch64-linux";
  hostname = "cancer";
  username = "hidekazu";
  stateVersion = "25.05";
  modules = [
    ./hardwares/vm-utm.nix
    ../profiles/nixos
  ];
}
