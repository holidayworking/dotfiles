{ delib, pkgs, ... }:
delib.module {
  name = "programs.tmux";

  home.always.home = {
    packages = with pkgs; [
      tmux
    ];

    file.".tmux.conf".source = ../../dotfiles/.tmux.conf;
  };
}
