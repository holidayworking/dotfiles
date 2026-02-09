{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.appcleaner";

  options = delib.singleEnableOption (pkgs.stdenv.isDarwin && host.isDesktop);

  home.ifEnabled.home.packages = with pkgs; [
    appcleaner
  ];
}
