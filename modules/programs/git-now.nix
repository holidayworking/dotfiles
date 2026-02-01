{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.git-now";

  options = delib.singleEnableOption host.shellFeatured;

  home.ifEnabled.home = {
    packages = with pkgs; [
      local.git-now
    ];
  };
}
