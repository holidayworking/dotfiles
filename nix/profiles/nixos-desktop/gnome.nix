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
  environment = {
    gnome.excludePackages = with pkgs; [
      gnome-tour
    ];

    systemPackages = with pkgs; [
      dconf-editor
      gnome-tweaks
      gnomeExtensions.appindicator
      gnomeExtensions.dash-to-dock
      gnomeExtensions.kimpanel
      gnomeExtensions.pop-shell
      gnomeExtensions.user-themes
      gnomeExtensions.xremap
      nautilus
      pop-gtk-theme
      pop-icon-theme
      pop-launcher
      pop-wallpapers
    ];
  };

  home-manager = {
    users."${username}" = {
      dconf.settings = {
        "org/gnome/desktop/background" = {
          picture-uri = "file:///${pkgs.pop-wallpapers}/share/backgrounds/pop/kate-hazen-pop-retro1.png";
          picture-uri-dark = "file:///${pkgs.pop-wallpapers}/share/backgrounds/pop/kate-hazen-pop-retro1.png";
        };

        "org/gnome/desktop/interface" = {
          color-scheme = "prefer-dark";
          cursor-theme = "Pop";
          gtk-theme = "Pop-dark";
          icon-theme = "Pop";
          scaling-factor = scalingFactor;
        };

        "org/gnome/desktop/peripherals/mouse" = {
          natural-scroll = true;
        };

        "org/gnome/desktop/wm/keybindings" = {
          activate-window-menu = [ ];
          begin-move = [ ];
          begin-resize = [ ];
          close = [ ];
          cycle-group = [ ];
          cycle-group-backward = [ ];
          cycle-panels = [ ];
          cycle-panels-backward = [ ];
          cycle-windows = [ ];
          cycle-windows-backward = [ ];
          maximize = [ ];
          minimize = [ ];
          move-to-monitor-down = [ ];
          move-to-monitor-left = [ ];
          move-to-monitor-right = [ ];
          move-to-monitor-up = [ ];
          move-to-workspace-1 = [ ];
          move-to-workspace-down = [ ];
          move-to-workspace-last = [ ];
          move-to-workspace-left = [ ];
          move-to-workspace-right = [ ];
          move-to-workspace-up = [ ];
          panel-run-dialog = [ ];
          switch-applications = [ ];
          switch-applications-backward = [ ];
          switch-group = [ ];
          switch-group-backward = [ ];
          switch-input-source = [ ];
          switch-input-source-backward = [ ];
          switch-panels = [ ];
          switch-panels-backward = [ ];
          switch-to-workspace-1 = [ ];
          switch-to-workspace-down = [ ];
          switch-to-workspace-last = [ ];
          switch-to-workspace-left = [ ];
          switch-to-workspace-right = [ ];
          switch-to-workspace-up = [ ];
          toggle-maximized = [ ];
          toggle-tiled-left = [ ];
          toggle-tiled-right = [ ];
          unmaximize = [ ];
        };

        "org/gnome/mutter/wayland/keybindings" = {
          restore-shortcuts = [ ];
          switch-to-session-1 = [ ];
          switch-to-session-2 = [ ];
          switch-to-session-3 = [ ];
          switch-to-session-4 = [ ];
          switch-to-session-5 = [ ];
          switch-to-session-6 = [ ];
          switch-to-session-7 = [ ];
          switch-to-session-8 = [ ];
          switch-to-session-9 = [ ];
          switch-to-session-10 = [ ];
          switch-to-session-11 = [ ];
          switch-to-session-12 = [ ];
        };

        "org/gnome/settings-daemon/plugins/media-keys" = {
          help = [ ];
          logout = [ ];
          magnifier = [ ];
          magnifier-zoom-in = [ ];
          magnifier-zoom-out = [ ];
          screenreader = [ ];
          screensaver = [ ];
        };

        "org/gnome/shell" = {
          disable-user-extensions = false;
          enabled-extensions = with pkgs.gnomeExtensions; [
            appindicator.extensionUuid
            dash-to-dock.extensionUuid
            kimpanel.extensionUuid
            pop-shell.extensionUuid
            user-themes.extensionUuid
            xremap.extensionUuid
          ];
        };

        "org/gnome/shell/extensions/dash-to-dock" = {
          disable-overview-on-startup = true;
          dock-fixed = true;
          dock-position = "LEFT";
          extend-height = true;
          show-apps-at-top = false;
          show-favorites = false;
          show-mounts = false;
          show-trash = false;
        };

        "org/gnome/shell/extensions/pop-shell" = {
          "activate-launcher" = [ "<Super>space" ];
          "focus-down" = [ ];
          "focus-left" = [ ];
          "focus-right" = [ ];
          "focus-up" = [ ];
          "management-orientation" = [ ];
          "pop-monitor-down" = [ ];
          "pop-monitor-left" = [ ];
          "pop-monitor-right" = [ ];
          "pop-monitor-up" = [ ];
          "pop-workspace-down" = [ ];
          "pop-workspace-up" = [ ];
          "tile-accept" = [ ];
          "tile-enter" = [ ];
          "tile-move-down" = [ ];
          "tile-move-down-global" = [ ];
          "tile-move-left" = [ ];
          "tile-move-left-global" = [ ];
          "tile-move-right" = [ ];
          "tile-move-right-global" = [ ];
          "tile-move-up" = [ ];
          "tile-move-up-global" = [ ];
          "tile-orientation" = [ ];
          "tile-reject" = [ ];
          "tile-resize-down" = [ ];
          "tile-resize-left" = [ ];
          "tile-resize-right" = [ ];
          "tile-resize-up" = [ ];
          "tile-swap-down" = [ ];
          "tile-swap-left" = [ ];
          "tile-swap-right" = [ ];
          "tile-swap-up" = [ ];
          "toggle-floating" = [ ];
          "toggle-stacking" = [ ];
          "toggle-stacking-global" = [ ];
          "toggle-tiling" = [ ];
        };

        "org/gnome/shell/extensions/user-theme" = {
          name = "Pop-dark";
        };

        "org/gnome/shell/keybindings" = {
          focus-active-notification = [ ];
          open-new-window-application-1 = [ ];
          open-new-window-application-2 = [ ];
          open-new-window-application-3 = [ ];
          open-new-window-application-4 = [ ];
          open-new-window-application-5 = [ ];
          open-new-window-application-6 = [ ];
          open-new-window-application-7 = [ ];
          open-new-window-application-8 = [ ];
          open-new-window-application-9 = [ ];
          screenshot = [ ];
          screenshot-window = [ ];
          show-screen-recording-ui = [ ];
          show-screenshot-ui = [ ];
          switch-to-application-1 = [ ];
          switch-to-application-2 = [ ];
          switch-to-application-3 = [ ];
          switch-to-application-4 = [ ];
          switch-to-application-5 = [ ];
          switch-to-application-6 = [ ];
          switch-to-application-7 = [ ];
          switch-to-application-8 = [ ];
          switch-to-application-9 = [ ];
          toggle-application-view = [ ];
          toggle-message-tray = [ ];
          toggle-quick-settings = [ ];
          shift-overview-down = [ ];
          shift-overview-up = [ ];
        };

        "org/gnome/mutter" = {
          "overlay-key" = "";
        };
      };
    };
  };

  programs.dconf.profiles.gdm.databases = [
    {
      settings = {
        "org/gnome/desktop/interface" = {
          scaling-factor = scalingFactor;
        };
      };
    }
  ];

  services = {
    gnome = {
      core-utilities.enable = false;
    };

    xserver = {
      enable = true;
      desktopManager.gnome.enable = true;
      displayManager.gdm.enable = true;
      excludePackages = [ pkgs.xterm ];
    };
  };
}
