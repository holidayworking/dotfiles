{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.slack";

  options = delib.singleEnableOption (pkgs.stdenv.isDarwin && host.isDesktop);

  home.ifEnabled.home.packages = with pkgs; [
    slack
  ];
}
