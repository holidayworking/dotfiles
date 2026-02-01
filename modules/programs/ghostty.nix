{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.ghostty";

  options = delib.singleEnableOption host.desktopFeatured;

  home.ifEnabled.programs.ghostty = {
    enable = true;
    package = pkgs.brewCasks.ghostty;

    settings = {
      font-family = "FiraCode Nerd Font";
      font-size = "14";
      theme = "GitHub Dark Default";
      shell-integration-features = "no-path,ssh-env,ssh-terminfo";
    };
  };
}
