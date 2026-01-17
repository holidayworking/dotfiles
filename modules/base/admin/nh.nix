{
  flake.modules.darwin.base =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        nh
      ];
    };
}
