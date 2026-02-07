{
  delib,
  mcpServers,
  inputs,
  pkgs,
  ...
}:
delib.module {
  name = "programs.claude-code";

  home.always.programs.claude-code = {
    enable = true;
    package = pkgs.llm-agents.claude-code;
    mcpServers = (inputs.mcp-servers-nix.lib.evalModule pkgs mcpServers).config.settings.servers;
  };
}
