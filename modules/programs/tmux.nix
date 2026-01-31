{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.tmux";

  options = delib.singleEnableOption host.shellFeatured;

  home.ifEnabled.home = {
    packages = with pkgs; [
      tmux
    ];

    file.".tmux.conf".source = ../../dotfiles/.tmux.conf;
  };
}
