{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.1password";

  options = delib.singleEnableOption host.shellFeatured;

  nixos.ifEnabled.programs._1password.enable = true;
}
