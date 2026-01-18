{ ... }:
{
  flake.modules = {
    darwin.desktop = {
      homebrew.casks = [
        "karabiner-elements"
      ];
    };

    homeManager.desktop = {
      xdg.configFile."karabiner/karabiner.json".source =
        ../../../dotfiles/.config/karabiner/karabiner.json;
    };
  };
}
