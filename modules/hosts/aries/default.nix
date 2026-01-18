{
  config,
  inputs,
  ...
}:
{
  flake.modules.darwin."hosts/aries" =
    { pkgs, lib, ... }:
    let
      username = "hidekazu";
    in
    {
      imports =
        with config.flake.modules.darwin;
        [
          base
          desktop
        ]
        ++ [
          {
            home-manager.users.${username} = {
              imports = with config.flake.modules.homeManager; [
                base
                dev
                desktop
                shell
              ];
            };
          }
        ];

      networking.knownNetworkServices = [
        "Wi-Fi"
      ];

      nix-homebrew.user = username;

      nixpkgs = {
        config.allowUnfree = true;
        hostPlatform = "aarch64-darwin";

        overlays = [
          inputs.brew-nix.overlays.default
          inputs.self.overlays.default
        ];
      };

      system.primaryUser = username;
    };
}
