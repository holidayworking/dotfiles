{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "services.gnome";

  options = delib.singleEnableOption (pkgs.stdenv.isLinux && host.isDesktop);

  nixos.ifEnabled = {
    environment = {
      gnome.excludePackages = with pkgs; [
        gnome-tour
        gnome-user-docs
      ];

      systemPackages = with pkgs; [
        dconf-editor
        gnome-console
        gnome-tweaks
        gnomeExtensions.appindicator
        gnomeExtensions.kimpanel
        nautilus
      ];
    };

    services = {
      desktopManager.gnome.enable = true;
      displayManager.gdm.enable = true;
      gnome.core-apps.enable = false;
    };
  };

  home.ifEnabled.dconf.settings = {
    "org/gnome/Console" = {
      use-system-font = false;
      custom-font = "FiraCode Nerd Font 14";
    };

    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = with pkgs.gnomeExtensions; [
        appindicator.extensionUuid
        kimpanel.extensionUuid
      ];
    };
  };
}
