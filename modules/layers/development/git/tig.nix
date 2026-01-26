{
  flake.modules.homeManager.development =
    { pkgs, ... }:
    {
      home = {
        packages = with pkgs; [
          tig
        ];

        file.".tigrc".source = ../../../../dotfiles/.tigrc;
      };
    };
}
