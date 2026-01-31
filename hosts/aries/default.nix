{ delib, ... }:
delib.host {
  name = "aries";

  system = "aarch64-darwin";
  type = "laptop";

  features = [
    "shell"
    "desktop"
  ];

  home.home.stateVersion = "25.05";

  darwin = {
    system.stateVersion = 5;

    networking.knownNetworkServices = [
      "Wi-Fi"
    ];
  };
}
