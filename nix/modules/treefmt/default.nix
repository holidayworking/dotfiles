{ pkgs, ... }:
{
  projectRootFile = "flake.nix";
  programs = {
    actionlint.enable = true;
    fish_indent.enable = true;
    nixfmt.enable = true;
    prettier.enable = true;
    shellcheck.enable = true;
    yamlfmt.enable = true;
  };
  settings.global.excludes = [ "pnpm-lock.yaml" ];
}
