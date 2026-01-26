{
  flake.modules.homeManager.shell =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        starship
      ];

      xdg.configFile = {
        "starship.toml".source = ../../../dotfiles/.config/starship.toml;
      };
    };
}
