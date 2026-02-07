{ delib, pkgs, ... }:
delib.module {
  name = "programs.tig";

  home.always.home = {
    packages = with pkgs; [
      tig
    ];

    file.".tigrc".source = ../../dotfiles/.tigrc;
  };
}
