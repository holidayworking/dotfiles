{
  flake.modules.homeManager.desktop =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        ghostty-bin
      ];

      xdg.configFile."ghostty/config".source = ../../dotfiles/.config/ghostty/config;
    };
}
