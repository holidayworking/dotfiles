{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.maccy";

  options = delib.singleEnableOption (pkgs.stdenv.isDarwin && host.isDesktop);

  home.ifEnabled.home.packages = with pkgs; [
    maccy
  ];
}
