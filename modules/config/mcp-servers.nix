{
  delib,
  lib,
  pkgs,
  ...
}:
delib.module {
  name = "mcp-servers";

  myconfig.always.args.shared.mcpServers = {
    settings.servers = {
      nixos = {
        command = "${pkgs.lib.getExe' pkgs.uv "uvx"}";
        args = [
          "mcp-nixos"
        ];
      };
    };

    programs = {
      context7.enable = true;
      # nixos.enable = true;
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
