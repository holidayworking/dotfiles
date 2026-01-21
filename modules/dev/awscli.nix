{
  flake.modules.homeManager.dev =
    { pkgs, ... }:
    {
      programs.awscli.enable = true;
    };
}
