{
  flake.modules = {
    darwin.base =
      { hostConfig, ... }:
      {
        networking = {
          computerName = hostConfig.name;
          hostName = hostConfig.name;
        };
      };

    nixos.base =
      { hostConfig, ... }:
      {
        networking = {
          hostName = hostConfig.name;
        };
      };
  };
}
