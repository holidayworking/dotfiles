{
  flake.modules.homeManager.development =
    { pkgs, ... }:
    {
      programs.jq.enable = true;
    };
}
