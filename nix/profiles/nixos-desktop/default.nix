{
  lib,
  nixpkgs,
  xremap-flake,
  system,
  username,
  ...
}:
let
  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };
  scalingFactor = lib.gvariant.mkUint32 2;
in
{
  imports = [
    xremap-flake.nixosModules.default
    ../nixos
    ./font.nix
    ./gnome.nix
    ./i18n.nix
    ./sound.nix
    ./xremap.nix
  ];

  home-manager = {
    users."${username}" = {
      home = {
        packages =
          with pkgs;
          [
            _1password-gui
            ghostty
            vscode
          ]
          ++ lib.optionals (system == "aarch64-linux") [
            firefox
          ]
          ++ lib.optionals (system == "x86_64-linux") [
            microsoft-edge
          ];
      };
    };
  };

  networking.networkmanager.enable = true;

  users = {
    users = {
      "${username}" = {
        extraGroups = [
          "docker"
          "networkmanager"
          "wheel"
        ];
      };
    };
  };
}
