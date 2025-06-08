{
  system,
}:
let
  isDarwin = system == "aarch64-darwin" || system == "x86_64-darwin";
in
if isDarwin then
  {
    darwin = {
      defaults = {
        "com.apple.Safari" = {
          AutoFillPasswords = false;
          AutoOpenSafeDownloads = false;
          IncludeDevelopMenu = true;
        };
      };
    };
  }
else
  { }
