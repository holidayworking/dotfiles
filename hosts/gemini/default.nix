{ delib, ... }:
delib.host {
  name = "gemini";

  system = "aarch64-linux";
  type = "desktop";

  home.home.stateVersion = "25.05";

  myconfig = {
    programs.ghostty.enable = false;
    services.openssh.enable = true;
  };

  nixos = {
    environment.sessionVariables = {
      PATH = [ "$HOME/.local/share/aquaproj-aqua/bin" ];
    };

    system.stateVersion = "25.05";
  };
}
