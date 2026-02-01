{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.starship";

  options = delib.singleEnableOption host.shellFeatured;

  home.ifEnabled = {
    home.packages = with pkgs; [
      starship
    ];

    xdg.configFile."starship.toml".source = ../../dotfiles/.config/starship.toml;
  };
}
