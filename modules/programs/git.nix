{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.git";

  options = delib.singleEnableOption host.shellFeatured;

  home.ifEnabled.home = {
    packages = with pkgs; [
      git
    ];

    file = {
      ".gitconfig".source = ../../dotfiles/.gitconfig;
      ".gitignore_global".source = ../../dotfiles/.gitignore_global;
    };
  };
}
