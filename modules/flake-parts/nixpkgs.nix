{
  inputs,
  withSystem,
  ...
}:
{
  imports = [
    inputs.pkgs-by-name-for-flake-parts.flakeModule
  ];

  perSystem =
    { system, config, ... }:
    {
      _module.args.pkgs = import inputs.nixpkgs {
        inherit system;
        overlays = [
          (final: prev: {
            local = config.packages;
          })
        ];
      };
      pkgsDirectory = ../../packages;
    };

  flake = {
    overlays.default =
      final: prev:
      withSystem prev.stdenv.hostPlatform.system (
        { config, ... }:
        {
          local = config.packages;
        }
      )
      // {
        # Skip tests for mcp-nixos dependencies that fail on macOS with Python 3.13.
        # - rocksdict: pytest crashes with "Trace/BPT trap" during test execution
        # - py-key-value-aio: rocksdb-related tests fail with assertion errors
        python313Packages = prev.python313Packages.overrideScope (
          _: pprev: {
            rocksdict = pprev.rocksdict.overridePythonAttrs { doCheck = false; };
            py-key-value-aio = pprev.py-key-value-aio.overridePythonAttrs { doCheck = false; };
          }
        );
      };
  };
}
