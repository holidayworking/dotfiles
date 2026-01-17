{
  flake.modules.homeManager.dev =
    { pkgs, ... }:
    {
      home = {
        packages = with pkgs; [
          tig
        ];

        file.".tigrc".source = ../../../dotfiles/.tigrc;
      };
    };
}
