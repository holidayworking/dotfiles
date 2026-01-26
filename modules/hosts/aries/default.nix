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
            home-manager.users.${username} =
              { pkgs, lib, ... }:
              {
                imports = with config.flake.modules.homeManager; [
                  base
                  shell
                  desktop
                  development
                ];

                home.activation.setupDockerContext = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
                  if ! ${pkgs.docker}/bin/docker context inspect gemini &> /dev/null; then
                    $DRY_RUN_CMD ${pkgs.docker}/bin/docker context create gemini \
                      --docker "host=ssh://gemini"
                  fi
                  $DRY_RUN_CMD ${pkgs.docker}/bin/docker context use gemini
                '';
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
          inputs.code-cursor.overlays.default
          inputs.nix-vscode-extensions.overlays.default
          inputs.self.overlays.default
        ];
      };

      system.primaryUser = username;
    };
}
