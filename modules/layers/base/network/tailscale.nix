{
  flake.modules = {
    darwin.base = {
      services.tailscale = {
        enable = true;
        overrideLocalDns = true;
      };
    };

    nixos.base = {
      services.tailscale = {
        enable = true;
      };
    };
  };
}
