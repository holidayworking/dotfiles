{
  flake.modules.darwin.desktop =
    { pkgs, ... }:
    {
      homebrew.masApps."1Password for Safari" = 1569813296;

      programs._1password-gui = {
        enable = true;
        package = pkgs.brewCasks."1password";
      };
    };
}
