{
  flake.modules.homeManager.shell =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        fish
      ];

      programs = {
        bash = {
          enable = pkgs.stdenv.isLinux;
          initExtra = ''
            if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
            then
              shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
              exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
            fi
          '';
        };

        zsh = {
          enable = pkgs.stdenv.isDarwin;
          initContent = ''
            if [[ $(ps -o command= -p "$PPID" | awk '{print $1}') != 'fish' ]]
            then
                exec ${pkgs.fish}/bin/fish -l
            fi
          '';
        };
      };

      xdg.configFile = {
        "fish/config.fish".source = ../../dotfiles/.config/fish/config.fish;
        "fish/fish_plugins".source = ../../dotfiles/.config/fish/fish_plugins;
      };
    };
}
