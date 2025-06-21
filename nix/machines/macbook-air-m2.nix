{ inputs }:
let
  inherit (inputs) nix-darwin home-manager nixpkgs;

  system = "aarch64-darwin";
  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };

  username = "hidekazu";

  configuration = {
    homebrew = {
      enable = true;
      brews = [ "mas" ];
      casks = [
        "1password"
        "appcleaner"
        "chatgpt"
        "docker"
        "font-fira-code"
        "hyper"
        "karabiner-elements"
        "maccy"
        "microsoft-edge"
        "notion"
        "ogdesign-eagle"
        "utm"
        "visual-studio-code"
      ];
      masApps = {
        "1Password for Safari" = 1569813296;
        "Eagle for Safari" = 1526651672;
        "Keynote" = 409183694;
        "Numbers" = 409203825;
        "Pages" = 409201541;
        "Photomator" = 1444636541;
        "Slack" = 803453959;
        "Tailscale" = 1475387142;
        "The Unarchiver" = 425424353;
        "Toggl Track" = 1291898086;
        "Windows App" = 1295203466;
      };
      onActivation = {
        autoUpdate = true;
        cleanup = "zap";
      };
    };
    security = {
      pam.services.sudo_local = {
        reattach = true;
        touchIdAuth = true;
      };
    };
    networking = {
      computerName = "aries";
      hostName = "aries";
    };
    nix = {
      gc = {
        automatic = true;
        interval = {
          Weekday = 0;
          Hour = 0;
          Minute = 0;
        };
        options = "--delete-older-than 7d";
      };
      optimise.automatic = true;
      settings = {
        experimental-features = [
          "flakes"
          "nix-command"
        ];
      };
    };
    nixpkgs = {
      hostPlatform = system;
    };
    system = {
      defaults = {
        SoftwareUpdate.AutomaticallyInstallMacOSUpdates = true;
        dock = {
          minimize-to-application = true;
          mru-spaces = false;
          show-recents = false;
          wvous-bl-corner = 4;
          wvous-br-corner = 5;
          wvous-tl-corner = 2;
          wvous-tr-corner = 3;
        };
        finder = {
          FXRemoveOldTrashItems = true;
          NewWindowTarget = "Home";
          ShowExternalHardDrivesOnDesktop = false;
          ShowRemovableMediaOnDesktop = false;
        };
        menuExtraClock.ShowSeconds = true;
      };
      primaryUser = username;
      stateVersion = 5;
    };
  };

  homeManagerConfiguration = {
    home-manager = {
      users."${username}" = {
        imports = [
          ../modules/home-manager
          {
            home.homeDirectory = pkgs.lib.mkForce "/Users/${username}/";
            targets.darwin.defaults."com.apple.Safari" = {
              AutoFillPasswords = false;
              AutoOpenSafeDownloads = false;
              IncludeDevelopMenu = true;
            };
          }
        ];
      };
      useGlobalPkgs = true;
      useUserPackages = true;
      extraSpecialArgs = { inherit pkgs system username; };
    };
  };
in
nix-darwin.lib.darwinSystem {
  modules = [
    configuration
    homeManagerConfiguration
    home-manager.darwinModules.home-manager
  ];
}
