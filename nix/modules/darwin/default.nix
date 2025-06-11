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
    gc = {
      automatic = true;
      interval = {
        Weekday = 0;
        Hour = 0;
        Minute = 0;
      };
      options = "--delete-older-than 7d";
    };
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
