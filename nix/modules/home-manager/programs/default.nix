{
  pkgs,
  username,
}:
{
  home-manager.enable = true;
  zsh = {
    enable = true;
    initContent = pkgs.lib.mkBefore ''
      if [[ -o interactive ]]; then
        exec /etc/profiles/per-user/${username}/bin/fish
      fi
    '';
  };
}
