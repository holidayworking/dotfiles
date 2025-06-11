{
  system,
  username,
  ...
}:
{
  homebrew = import ./homebrew;
  security = import ./security;
  system = import ./system { inherit username; };

  nix = {
    optimise.automatic = true;
    settings = {
      experimental-features = [
        "flakes"
        "nix-command"
      ];
    };
  };

  nixpkgs.hostPlatform = system;
}
