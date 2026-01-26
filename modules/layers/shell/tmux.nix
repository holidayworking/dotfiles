{
  flake.modules.homeManager.shell =
    { pkgs, ... }:
    {
      home = {
        packages = with pkgs; [
          tmux
        ];

        file.".tmux.conf".source = ../../../dotfiles/.tmux.conf;
      };
    };
}
