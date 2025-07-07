{ inputs }:
let
  lib = import ../lib { inherit inputs; };
in
lib.mkDarwinSystem {
  system = "aarch64-darwin";
  hostname = "aries";
  username = "hidekazu";
  stateVersion = "25.05";
  darwinStateVersion = 5;
  modules = [
    ../profiles/darwin
  ];
}
