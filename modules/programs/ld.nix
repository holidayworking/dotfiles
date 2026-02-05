{ delib, host, ... }:
delib.module {
  name = "programs.ld";

  options = delib.singleEnableOption host.shellFeatured;

  nixos.ifEnabled.programs.nix-ld.enable = true;
}
