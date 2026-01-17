{
  flake.modules.darwin.base = {
    services.tailscale = {
      enable = true;
      overrideLocalDns = true;
    };
  };
}
