{
  system,
  username,
  ...
}:
{
  homebrew = import ./homebrew;
  security = import ./security;
  system = import ./system { inherit username; };

  nixpkgs.hostPlatform = system;
}
