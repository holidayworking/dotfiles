{
  delib,
  host,
  mcpServers,
  inputs,
  pkgs,
  ...
}:
delib.module {
  name = "programs.codex";

  options = delib.singleEnableOption host.shellFeatured;

  home.ifEnabled.programs.codex = {
    enable = true;
    package = pkgs.llm-agents.codex;

    settings.mcp_servers =
      (inputs.mcp-servers-nix.lib.evalModule pkgs (
        mcpServers
        // {
          format = "toml-inline";
          flavor = "codex";
        }
      )).config.settings.servers;
  };
}
