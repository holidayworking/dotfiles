{
  flake.modules.homeManager.shell = {
    programs.tmux.enable = true;

    home.file.".tmux.conf".source = ../../dotfiles/.tmux.conf;
  };
}
