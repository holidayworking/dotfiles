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

  dotfile = name: { source = ../../../dotfiles + "/${name}"; };
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
              ".hyper.js"
              ".tigrc"
              ".tmux.conf"
            ];

        packages =
          let
            git-now = pkgs.callPackage ../../packages/git-now.nix { };
          in
          with pkgs;
          [
            _1password-cli
            awscli2
            direnv
            ffmpeg
            fish
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

        zsh = {
          enable = true;
          initContent = pkgs.lib.mkBefore ''
            if [[ -o interactive ]]; then
              exec /etc/profiles/per-user/${username}/bin/fish
            fi
          '';
        };
      };

      xdg = {
        configFile = builtins.foldl' (acc: name: acc // { ${name} = dotfile (".config/" + name); }) { } [
          "fish/completions/aws.fish"
          "fish/config.fish"
          "fish/fish_plugins"
          "karabiner/karabiner.json"
        ];
      };
    };
  };

  nix = {
    settings = {
      experimental-features = [
        "flakes"
        "nix-command"
      ];
    };

    gc.automatic = true;
    optimise.automatic = true;
  };

  nixpkgs.hostPlatform = system;
}
