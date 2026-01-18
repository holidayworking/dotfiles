{
  flake.modules.homeManager.desktop =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        brewCasks.microsoft-edge
      ];
    };
}
