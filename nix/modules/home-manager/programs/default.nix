{
  username,
  pkgs,

}:
{
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
}
