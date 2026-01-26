{
  flake.modules = {
    nixos.shell = {
      programs.zsh.enable = true;
    };

    homeManager.shell = {
      home.file.".zshrc".source = ../../../dotfiles/.zshrc;

      xdg.configFile = {
        "zsh/config.zsh".source = ../../../dotfiles/.config/zsh/config.zsh;
        "zsh/functions/peco_select_ghq_repository.zsh".source =
          ../../../dotfiles/.config/zsh/functions/peco_select_ghq_repository.zsh;
        "zsh/functions/peco_select_history.zsh".source =
          ../../../dotfiles/.config/zsh/functions/peco_select_history.zsh;
      };
    };
  };
}
