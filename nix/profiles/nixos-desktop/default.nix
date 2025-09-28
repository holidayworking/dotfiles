{
  lib,
  pkgs,
  xremap-flake,
  system,
  username,
  ...
}:
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

  environment.systemPackages =
    with pkgs;
    [
      ghostty
      vscode
    ]
    ++ lib.optionals (system == "aarch64-linux") [
      firefox
    ]
    ++ lib.optionals (system == "x86_64-linux") [
      microsoft-edge
    ];

  home-manager = {
    users."${username}" = {
      xdg = {
        enable = true;

        autostart = {
          enable = true;
          entries = [
            "${pkgs._1password-gui}/share/applications/1password.desktop"
          ];
        };
      };
    };
  };

  networking.networkmanager.enable = true;

  nixpkgs.config.allowUnfree = true;

  programs._1password-gui.enable = true;

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
