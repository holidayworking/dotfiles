{
  flake.modules.homeManager.desktop =
    { pkgs, ... }:
    {
      programs.vscode.enable = true;
    };
}
