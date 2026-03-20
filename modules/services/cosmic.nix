{
  delib,
  inputs,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "services.cosmic";

  options = delib.singleEnableOption (pkgs.stdenv.isLinux && host.isDesktop);

  nixos.ifEnabled = {
    services = {
      displayManager.cosmic-greeter.enable = true;
      desktopManager.cosmic.enable = true;
      system76-scheduler.enable = true;
    };
  };

  home.ifEnabled = {
    imports = [
      inputs.cosmic-manager.homeManagerModules.cosmic-manager
    ];

    wayland.desktopManager.cosmic = {
      enable = true;

      applets.app-list.settings = {
        enable_drag_source = true;
        favorites = [
          "com.system76.CosmicFiles"
        ];
      };

      shortcuts = [
        {
          key = "Super";
          action = {
            __type = "enum";
            variant = "Disable";
          };
        }
        {
          key = "Super+Alt+s";
          action = {
            __type = "enum";
            variant = "Disable";
          };
        }
        {
          key = "Super+space";
          action = {
            __type = "enum";
            variant = "System";
            value = [
              {
                __type = "enum";
                variant = "Launcher";
              }
            ];
          };
        }
        {
          key = "Super+slash";
          action = {
            __type = "enum";
            variant = "Disable";
          };
        }
      ];

      panels = [
        {
          margin = 0;
          name = "DocPanelk";
          plugins_center = {
            __type = "optional";
            value = [ "com.system76.CosmicAppletTime" ];
          };
          plugins_wings = {
            __type = "optional";
            value = {
              __type = "tuple";
              value = [
                [
                  "com.system76.CosmicPanelWorkspacesButton"
                  "com.system76.CosmicPanelAppButton"
                ]
                [
                  "com.system76.CosmicAppletInputSources"
                  "com.system76.CosmicAppletA11y"
                  "com.system76.CosmicAppletStatusArea"
                  "com.system76.CosmicAppletTiling"
                  "com.system76.CosmicAppletAudio"
                  "com.system76.CosmicAppletBluetooth"
                  "com.system76.CosmicAppletNetwork"
                  "com.system76.CosmicAppletBattery"
                  "com.system76.CosmicAppletNotifications"
                  "com.system76.CosmicAppletPower"
                ]
              ];
            };
          };
          size = {
            __type = "enum";
            variant = "XS";
          };
        }
        {
          margin = 0;
          name = "Dock";
          plugins_center = {
            __type = "optional";
            value = [ "com.system76.CosmicPanelLauncherButton" ];
          };
        }
      ];
    };

    xdg.userDirs = {
      enable = true;
      createDirectories = true;
    };
  };
}
