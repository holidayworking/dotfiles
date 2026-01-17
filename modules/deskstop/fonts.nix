{
  flake.modules.darwin.desktop =
    { pkgs, ... }:
    {
      fonts.packages = with pkgs; [
        fira-code
      ];
    };
}
