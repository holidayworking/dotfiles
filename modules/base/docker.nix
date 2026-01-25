{
  flake.modules = {
    nixos.base = {
      virtualisation.docker.enable = true;
    };

    homeManager.base =
      { pkgs, ... }:
      {
        home.packages = with pkgs; [
          docker
        ];
      };
  };
}
