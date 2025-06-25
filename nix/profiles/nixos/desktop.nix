{
  lib,
  nixpkgs,
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
  environment.gnome.excludePackages = (
    with pkgs;
    [
      gnome-tour
    ]
  );

  fonts = {
    packages = with pkgs; [
      fira-code
      nerd-fonts.hack
      nerd-fonts.jetbrains-mono
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-emoji
    ];

    fontconfig = {
      defaultFonts = {
        serif = [
          "Noto Serif CJK JP"
          "Noto Color Emoji"
        ];
        sansSerif = [
          "Noto Sans CJK JP"
          "Noto Color Emoji"
        ];
        monospace = [
          "JetBrainsMono Nerd Font"
          "Noto Color Emoji"
        ];
        emoji = [ "Noto Color Emoji" ];
      };
    };

    fontDir.enable = true;
  };

  home-manager = {
    users."${username}" = {
      dconf.settings = {
        "org/gnome/desktop/interface" = {
          scaling-factor = scalingFactor;
        };

        "org/gnome/desktop/peripherals/mouse" = {
          natural-scroll = true;
        };
      };

      home = {
        packages =
          with pkgs;
          [
            _1password-gui
            ghostty
            gnomeExtensions.xremap
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

  i18n = {
    defaultLocale = "ja_JP.UTF-8";

    extraLocaleSettings = {
      LC_ADDRESS = "ja_JP.UTF-8";
      LC_IDENTIFICATION = "ja_JP.UTF-8";
      LC_MEASUREMENT = "ja_JP.UTF-8";
      LC_MONETARY = "ja_JP.UTF-8";
      LC_NAME = "ja_JP.UTF-8";
      LC_NUMERIC = "ja_JP.UTF-8";
      LC_PAPER = "ja_JP.UTF-8";
      LC_TELEPHONE = "ja_JP.UTF-8";
      LC_TIME = "ja_JP.UTF-8";
    };
  };

  networking.networkmanager.enable = true;

  programs.dconf.profiles.gdm.databases = [
    {
      settings = {
        "org/gnome/desktop/interface" = {
          scaling-factor = scalingFactor;
        };
      };
    }
  ];

  security.rtkit.enable = true;

  services = {
    gnome = {
      core-utilities.enable = false;
    };

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    pulseaudio = {
      enable = false;
    };

    xremap = {
      config = {
        modmap = [
          {
            name = "Global";
            remap = {
              "CapsLock" = "Ctrl_L";
            };
          }
        ];
        keymap = [
          {
            name = "Global";
            application.not = [
              "Code"
              "com.mitchellh.ghostty"
            ];
            remap = {
              "C-a" = "home";
              "C-e" = "end";
              "Super-a" = "C-a";
              "Super-c" = "C-c";
              "Super-f" = "C-f";
              "Super-s" = "C-s";
              "Super-v" = "C-v";
              "Super-x" = "C-x";
              "Super-z" = "C-z";
            };
          }
          {
            name = "Ghostty";
            application = {
              only = [
                "com.mitchellh.ghostty"
              ];
            };
            remap = {
              "Super-a" = "C-Shift-a";
              "Super-c" = "C-Shift-c";
              "Super-f" = "C-Shift-f";
              "Super-v" = "C-Shift-v";
              "Super-x" = "C-Shift-x";
              "Super-z" = "C-Shift-z";
            };
          }
        ];
      };
      serviceMode = "user";
      userName = "${username}";
      withGnome = true;
    };

    xserver = {
      enable = true;
      desktopManager.gnome.enable = true;
      displayManager.gdm.enable = true;
      excludePackages = [ pkgs.xterm ];
    };
  };

  users = {
    groups = {
      "${username}" = {
        gid = 1000;
      };
    };

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
