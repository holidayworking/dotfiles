{
  flake.modules.homeManager.shell =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        sheldon
      ];

      xdg.configFile = {
        "sheldon/plugins.toml".source = ../../dotfiles/.config/sheldon/plugins.toml;
      };
    };
}
