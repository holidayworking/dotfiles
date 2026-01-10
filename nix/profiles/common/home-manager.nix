{
  pkgs,
  system,
  username,
  ...
}:
let
  dotfile = name: { source = ../../../dotfiles + "/${name}"; };
  git-now = pkgs.callPackage ../../packages/git-now.nix { };
in
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    users."${username}" = {
      home = {
        username = username;

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
              ".tigrc"
              ".tmux.conf"
              ".zshrc"
            ];

        packages = with pkgs; [
          awscli2
          direnv
          ffmpeg
          fish
          gemini-cli
          ghq
          git
          git-now
          gnumake
          google-cloud-sdk
          jq
          nh
          nixfmt-rfc-style
          peco
          proto
          shellcheck
          shfmt
          tig
          tmux
          vim
          yt-dlp
        ];
      };

      programs = {
        home-manager.enable = true;

        bash = {
          enable = true;
          initExtra = ''
            if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
            then
              shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
              exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
            fi
          '';
        };
      };

      xdg.configFile =
        builtins.foldl' (acc: name: acc // { ${name} = dotfile (".config/" + name); }) { }
          [
            "fish/completions/aws.fish"
            "fish/config.fish"
            "fish/fish_plugins"
            "ghostty/config"
            "karabiner/karabiner.json"
          ];
    };
  };
}
