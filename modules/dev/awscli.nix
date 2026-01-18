{
  flake.modules.homeManager.dev =
    { pkgs, ... }:
    {
      programs.awscli.enable = true;

      xdg.configFile."fish/completions/aws.fish".source =
        ../../dotfiles/.config/fish/completions/aws.fish;
    };
}
