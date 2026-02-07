{ delib, host, ... }:
delib.module {
  name = "programs.karabiner-elements";

  options = delib.singleEnableOption host.isDesktop;

  darwin.ifEnabled.homebrew.casks = [
    "karabiner-elements"
  ];

  home.ifEnabled.xdg.configFile."karabiner/karabiner.json".source =
    ../../dotfiles/.config/karabiner/karabiner.json;
}
