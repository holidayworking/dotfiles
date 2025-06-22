{ inputs }:
let
  inherit (inputs) nixpkgs nix-darwin home-manager;

  system = "aarch64-darwin";
  hostname = "aries";
  username = "hidekazu";
in
nix-darwin.lib.darwinSystem {
  modules = [
    home-manager.darwinModules.home-manager
    ../roles/base
    {
      home-manager = {
        users."${username}" = {
          home = {
            homeDirectory = nixpkgs.lib.mkForce "/Users/${username}/";
            stateVersion = "25.05";
          };

          targets.darwin.defaults."com.apple.Safari" = {
            AutoFillPasswords = false;
            AutoOpenSafeDownloads = false;
            IncludeDevelopMenu = true;
          };
        };
      };

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
        computerName = hostname;
        hostName = hostname;
      };

      system = {
        primaryUser = username;
        stateVersion = 5;

        defaults = {
          SoftwareUpdate.AutomaticallyInstallMacOSUpdates = true;
          menuExtraClock.ShowSeconds = true;

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
        };
      };
    }
  ];
  specialArgs = {
    inherit nixpkgs system username;
  };
}
