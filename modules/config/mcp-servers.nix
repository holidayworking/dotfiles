{
  delib,
  lib,
  pkgs,
  ...
}:
delib.module {
  name = "mcp-servers";

  myconfig.always.args.shared.mcpServers = {
    programs = {
      codex.enable = true;
      context7.enable = true;
      nixos = {
        enable = true;
        # mcp-nixos depends on fastmcp -> lupa, and lupa tries to build luajit21 by default.
        # On aarch64-linux this can fail with "Relocations in generic ELF (EM: 62)",
        # so we disable LuaJIT only for this dependency chain via LUPA_NO_LUAJIT.
        package = pkgs.mcp-nixos.override {
          python3Packages = pkgs.python3Packages.overrideScope (
            _final: prev: {
              lupa = prev.lupa.overridePythonAttrs (old: {
                env = (old.env or { }) // {
                  LUPA_NO_LUAJIT = "true";
                };
              });
            }
          );
        };
      };
      terraform.enable = true;

      github = {
        enable = true;
        passwordCommand = {
          GITHUB_PERSONAL_ACCESS_TOKEN = [
            (lib.getExe pkgs.gh)
            "auth"
            "token"
          ];
        };
      };
    };
  };
}
