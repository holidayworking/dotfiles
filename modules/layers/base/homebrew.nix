{
  flake.modules.darwin.base = {
    homebrew = {
      enable = true;

      brews = [
        "mas"
      ];

      onActivation = {
        autoUpdate = true;
        cleanup = "zap";
      };
    };

    nix-homebrew.enable = true;
  };
}
