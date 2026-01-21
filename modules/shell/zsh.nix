{
  flake.modules = {
    nixos.shell = {
      programs.zsh.enable = true;
    };

    homeManager.shell =
      { pkgs, ... }:
      {
        home.packages = with pkgs; [
          sheldon
        ];

        home.file.".zshrc".source = ../../dotfiles/.zshrc;

        xdg.configFile = {
          "sheldon/plugins.toml".source = ../../dotfiles/.config/sheldon/plugins.toml;
          "zsh/config.zsh".source = ../../dotfiles/.config/zsh/config.zsh;
          "zsh/functions/peco_select_ghq_repository.zsh".source =
            ../../dotfiles/.config/zsh/functions/peco_select_ghq_repository.zsh;
          "zsh/functions/peco_select_history.zsh".source =
            ../../dotfiles/.config/zsh/functions/peco_select_history.zsh;
        };
      };
  };
}
