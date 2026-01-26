{
  flake.modules.homeManager.development =
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
