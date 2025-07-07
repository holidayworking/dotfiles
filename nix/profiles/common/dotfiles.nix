{
  username,
  ...
}:
let
  dotfile = name: { source = ../../../dotfiles + "/${name}"; };
in
{
  home-manager.users."${username}" = {
    home.file =
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
        ];

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
}
