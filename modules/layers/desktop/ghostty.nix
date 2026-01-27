{
  flake.modules.homeManager.desktop =
    { pkgs, ... }:
    {
      programs.ghostty = {
        enable = true;
        package = pkgs.ghostty-bin;

        settings = {
          font-family = "FiraCode Nerd Font";
          font-size = "14";
          theme = "GitHub Dark Default";
          shell-integration-features = "no-path,ssh-env,ssh-terminfo";
        };
      };
    };
}
