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
    # Nixpkgs claude-code is too old, so install via llm-agents.nix instead.
    package = pkgs.llm-agents.claude-code;
    mcpServers = (inputs.mcp-servers-nix.lib.evalModule pkgs mcpServers).config.settings.servers;
  };
}
