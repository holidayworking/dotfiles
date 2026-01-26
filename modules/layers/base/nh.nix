{
  flake.modules = {
    darwin.base =
      { pkgs, ... }:
      {
        environment.systemPackages = with pkgs; [
          nh
        ];
      };

    nixos.base = {
      programs = {
        nh = {
          enable = true;

          clean = {
            enable = true;
            extraArgs = "--keep 2";
          };
        };
      };
    };
  };
}
