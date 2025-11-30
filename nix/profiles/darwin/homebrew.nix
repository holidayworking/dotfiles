{ ... }:
{
  homebrew = {
    enable = true;
    brews = [
      "lima"
      "mas"
    ];
    casks = [
      "1password"
      "appcleaner"
      "chatgpt"
      "firefox"
      "font-fira-code"
      "ghostty"
      "headlamp"
      "karabiner-elements"
      "maccy"
      "microsoft-edge"
      "notion"
      "steam"
      "utm@beta"
      "visual-studio-code"
    ];
    masApps = {
      "1Password for Safari" = 1569813296;
      "Eagle for Safari" = 1526651672;
      "Keynote" = 409183694;
      "Numbers" = 409203825;
      "Pages" = 409201541;
      "Slack" = 803453959;
      "Tailscale" = 1475387142;
      "The Unarchiver" = 425424353;
      "Toggl Track" = 1291898086;
      "Windows App" = 1295203466;
      "Xiaomi Interconnectivity" = 6673908449;
    };
    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
    };
  };
}
