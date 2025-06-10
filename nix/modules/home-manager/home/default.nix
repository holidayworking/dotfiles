{
  dotfile,
  pkgs,
  username,
}:
{
  username = username;
  stateVersion = "25.05";

  file =
    builtins.foldl'
      (
        acc: name:
        acc
        // {
          ${name} = dotfile name;
        }
      )
      { }
      [
        ".gitconfig"
        ".gitignore_global"
        ".hyper.js"
        ".tigrc"
        ".tmux.conf"
      ];

  packages = with pkgs; [
    awscli2
    direnv
    ffmpeg
    fish
    ghq
    git
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
