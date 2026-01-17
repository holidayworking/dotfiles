{
  flake.modules.homeManager.dev =
    { pkgs, ... }:
    {
      programs.jq.enable = true;
    };
}
