{ delib, ... }:
delib.module {
  name = "programs.yt-dlp";

  options = delib.singleEnableOption false;

  home.ifEnabled.programs.yt-dlp.enable = true;
}
