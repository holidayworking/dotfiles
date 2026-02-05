{ delib, host, ... }:
delib.module {
  name = "programs.vim";

  options = delib.singleEnableOption host.shellFeatured;

  home.ifEnabled.programs.vim.enable = true;
}
