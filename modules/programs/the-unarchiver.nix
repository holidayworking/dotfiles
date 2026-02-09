{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.the-unarchiver";

  options = delib.singleEnableOption (pkgs.stdenv.isDarwin && host.isDesktop);

  home.ifEnabled.home.packages = with pkgs; [
    the-unarchiver
  ];
}
