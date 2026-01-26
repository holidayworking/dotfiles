{
  flake.modules.homeManager.dev =
    { pkgs, ... }:
    {
      programs.gh.enable = true;
    };
}
