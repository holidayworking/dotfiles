{ ... }:
{
  nix = {
    settings = {
      experimental-features = [
        "flakes"
        "nix-command"
      ];
    };

    gc.automatic = true;
    optimise.automatic = true;
  };
}
