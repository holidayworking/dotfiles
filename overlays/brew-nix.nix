{
  delib,
  inputs,
  system,
  ...
}:
delib.overlayModule {
  name = "brew-nix";
  overlay = inputs.brew-nix.overlays.default;
  targets = [ "darwin" ];
}
