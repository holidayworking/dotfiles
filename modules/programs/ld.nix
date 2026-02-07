{ delib, ... }:
delib.module {
  name = "programs.ld";

  nixos.always.programs.nix-ld.enable = true;
}
