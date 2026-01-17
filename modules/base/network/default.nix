{
  flake.modules.darwin.base =
    { hostConfig, ... }:
    {
      networking = {
        computerName = hostConfig.name;
        hostName = hostConfig.name;
      };
    };
}
