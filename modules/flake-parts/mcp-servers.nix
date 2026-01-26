{ inputs, ... }:
{
  flake.mkMcpConfig =
    pkgs: config:
    inputs.mcp-servers-nix.lib.mkConfig pkgs (
      {
        programs = {
          context7.enable = true;
          nixos.enable = true;
          terraform.enable = true;

          github = {
            enable = true;
            passwordCommand = {
              GITHUB_PERSONAL_ACCESS_TOKEN = [
                "gh"
                "auth"
                "token"
              ];
            };
          };
        };
      }
      // config
    );
}
