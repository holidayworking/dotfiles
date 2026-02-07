{ delib, ... }:
delib.host {
  name = "aries";

  system = "aarch64-darwin";
  type = "desktop";

  home.home.stateVersion = "25.05";

  darwin = {
    system.stateVersion = 5;

    networking.knownNetworkServices = [
      "Wi-Fi"
    ];
  };
}
