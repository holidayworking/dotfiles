{
  delib,
  host,
  mcpServers,
  inputs,
  pkgs,
  ...
}:
delib.module {
  name = "programs.claude-code";

  options = delib.singleEnableOption host.shellFeatured;

  home.ifEnabled.programs.claude-code = {
    enable = true;
    package = pkgs.llm-agents.claude-code;
    mcpServers = (inputs.mcp-servers-nix.lib.evalModule pkgs mcpServers).config.settings.servers;
  };
}
