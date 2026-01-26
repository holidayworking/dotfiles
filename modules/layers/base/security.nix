{
  flake.modules = {
    darwin.base = {
      security.pam.services.sudo_local = {
        reattach = true;
        touchIdAuth = true;
      };
    };

    nixos.base = {
      security.sudo-rs = {
        enable = true;
        wheelNeedsPassword = false;
      };
    };
  };
}
