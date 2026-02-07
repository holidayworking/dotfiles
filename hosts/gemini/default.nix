{ delib, ... }:
delib.host {
  name = "gemini";

  system = "aarch64-linux";
  type = "server";

  home.home.stateVersion = "25.05";

  nixos =
    { myconfig, ... }:
    {
      environment.sessionVariables = {
        PATH = [ "$HOME/.local/share/aquaproj-aqua/bin" ];
      };

      system.stateVersion = "25.05";

      services.openssh.enable = true;

      users.users.${myconfig.constants.username}.openssh.authorizedKeys.keys =
        myconfig.constants.authorizedKeys;
    };
}
