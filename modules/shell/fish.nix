{
  flake.modules.homeManager.shell =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        fish
      ];

      programs = {
        zsh = {
          enable = true;
          initContent = ''
            if [[ $(ps -o command= -p "$PPID" | awk '{print $1}') != 'fish' ]]
            then
                exec ${pkgs.fish}/bin/fish -l
            fi
          '';
        };
      };

      xdg.configFile = {
        "fish/config.fish".source = ../../dotfiles/.config/fish/config.fish;
        "fish/fish_plugins".source = ../../dotfiles/.config/fish/fish_plugins;
      };
    };
}
