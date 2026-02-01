{ delib, ... }:
let
  shared.nix = {
    optimise.automatic = true;

    settings.experimental-features = [
      "flakes"
      "nix-command"
    ];
  };
in
delib.module {
  name = "nix";

  nixos.always = shared;
  darwin.always = shared;
}
