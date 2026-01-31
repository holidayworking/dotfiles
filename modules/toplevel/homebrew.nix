{ delib, inputs, ... }:
delib.module {
  name = "homebrew";

  darwin.always =
    { myconfig, ... }:
    {
      imports = [
        inputs.nix-homebrew.darwinModules.nix-homebrew
      ];

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

      nix-homebrew = {
        enable = true;
        user = myconfig.constants.username;
      };
    };
}
