{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.sheldon";

  options = delib.singleEnableOption host.shellFeatured;

  home.ifEnabled = {
    home.packages = with pkgs; [
      sheldon
    ];

    xdg.configFile."sheldon/plugins.toml".source = ../../dotfiles/.config/sheldon/plugins.toml;
  };
}
