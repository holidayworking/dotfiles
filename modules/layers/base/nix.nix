{
  flake.modules = {
    darwin.base = {
      nix = {
        optimise.automatic = true;

        settings.experimental-features = [
          "flakes"
          "nix-command"
        ];
      };
    };

    nixos.base = {
      nix = {
        optimise.automatic = true;

        settings.experimental-features = [
          "flakes"
          "nix-command"
        ];
      };
    };
  };
}
