{
  dotfile,
}:
{
  configFile = builtins.foldl' (acc: name: acc // { ${name} = dotfile (".config/" + name); }) { } [
    "fish/completions/aws.fish"
    "fish/config.fish"
    "fish/fish_plugins"
    "karabiner/karabiner.json"
  ];
}
