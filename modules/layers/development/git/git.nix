{
  flake.modules.homeManager.development =
    { pkgs, ... }:
    {
      home = {
        packages = with pkgs; [
          git
        ];

        file = {
          ".gitconfig".source = ../../../../dotfiles/.gitconfig;
          ".gitignore_global".source = ../../../../dotfiles/.gitignore_global;
        };
      };
    };
}
