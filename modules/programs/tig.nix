{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.tig";

  options = delib.singleEnableOption host.shellFeatured;

  home.ifEnabled.home = {
    packages = with pkgs; [
      tig
    ];

    file.".tigrc".source = ../../dotfiles/.tigrc;
  };
}
