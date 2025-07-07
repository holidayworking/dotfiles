{
  nixpkgs,
  system,
  username,
  ...
}:
let
  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };

  git-now = pkgs.callPackage ../../packages/git-now.nix { };
in
{
  home-manager.users."${username}".home.packages = with pkgs; [
    _1password-cli
    awscli2
    direnv
    ffmpeg
    fish
    gemini-cli
    ghq
    git
    git-now
    gnumake
    jq
    nixfmt-rfc-style
    peco
    proto
    shfmt
    tig
    tmux
    vim
    yt-dlp
  ];
}
