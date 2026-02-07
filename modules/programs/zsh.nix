{ delib, ... }:
delib.module {
  name = "programs.zsh";

  nixos.always.programs.zsh.enable = true;

  home.always = {
    home.file.".zshrc".source = ../../dotfiles/.zshrc;

    xdg.configFile = {
      "zsh/config.zsh".source = ../../dotfiles/.config/zsh/config.zsh;
      "zsh/functions/peco_select_ghq_repository.zsh".source =
        ../../dotfiles/.config/zsh/functions/peco_select_ghq_repository.zsh;
      "zsh/functions/peco_select_history.zsh".source =
        ../../dotfiles/.config/zsh/functions/peco_select_history.zsh;
    };
  };
}
