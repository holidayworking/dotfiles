{ delib, ... }:
delib.host {
  name = "gemini";

  system = "aarch64-linux";
  type = "server";

  home.home.stateVersion = "25.05";

  myconfig.services.openssh.enable = true;

  nixos =
    { myconfig, ... }:
    {
      environment.sessionVariables = {
        PATH = [ "$HOME/.local/share/aquaproj-aqua/bin" ];
      };

      system.stateVersion = "25.05";
    };
}
