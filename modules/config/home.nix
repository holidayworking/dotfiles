{ delib, pkgs, ... }:
delib.module {
  name = "home";

  home.always =
    { myconfig, ... }:
    let
      isDarwin = pkgs.stdenv.isDarwin;
    in
    {
      home.homeDirectory = pkgs.lib.mkForce (
        if isDarwin then
          "/Users/${myconfig.constants.username}/"
        else
          "/home/${myconfig.constants.username}"
      );

      targets.darwin = pkgs.lib.mkIf isDarwin {
        copyApps.enable = true;
        linkApps.enable = false;
      };
    };
}
