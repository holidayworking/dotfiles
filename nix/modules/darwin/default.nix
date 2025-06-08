{
  system,
  username,
}:
{
  homebrew = import ./homebrew;
  security = import ./security;
  system = import ./system { inherit username; };

  nix.enable = false;
  nixpkgs.hostPlatform = system;
}
