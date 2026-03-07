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

      panels = [
        {
          margin = 0;
          name = "Dock";
          plugins_center = {
            __type = "optional";
            value = [ "com.system76.CosmicPanelLauncherButton" ];
          };
        }
      ];

      applets.app-list.settings = {
        enable_drag_source = true;
        favorites = [
          "com.system76.CosmicFiles"
        ];
      };
    };

    xdg.userDirs = {
      enable = true;
      createDirectories = true;
    };
  };
}
