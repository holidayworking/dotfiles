{ delib, pkgs, ... }:

delib.module {
  name = "programs.starship";

  home.always = {
    home.packages = with pkgs; [
      starship
    ];

    xdg.configFile."starship.toml".source = ../../dotfiles/.config/starship.toml;
  };
}
