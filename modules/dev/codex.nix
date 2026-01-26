{
  flake.modules.homeManager.dev =
    { pkgs, inputs, ... }:
    {
      home = {
        packages = with pkgs; [
          codex
        ];

        file.".codex/config.toml".source = inputs.self.mkMcpConfig pkgs {
          flavor = "codex";
          format = "toml-inline";
        };
      };
    };
}
