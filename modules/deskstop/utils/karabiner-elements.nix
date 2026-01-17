{ ... }:
{
  flake.modules.darwin.desktop = {
    homebrew.casks = [
      "karabiner-elements"
    ];
  };

  flake.modules.homeManager.desktop = {
    xdg.configFile."karabiner/karabiner.json".source =
      ../../../dotfiles/.config/karabiner/karabiner.json;
  };
}
