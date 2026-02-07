{ delib, pkgs, ... }:
delib.module {
  name = "programs.sheldon";

  home.always = {
    home.packages = with pkgs; [
      sheldon
    ];

    xdg.configFile."sheldon/plugins.toml".source = ../../dotfiles/.config/sheldon/plugins.toml;
  };
}
