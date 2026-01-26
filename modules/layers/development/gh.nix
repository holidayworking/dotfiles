{
  flake.modules.homeManager.development =
    { pkgs, ... }:
    {
      programs.gh.enable = true;
    };
}
