if command -sq /usr/libexec/path_helper
  eval (env PATH='' /usr/libexec/path_helper -c)
end

set -g theme_display_date no
set -g theme_display_ruby no

set -gx SHELL (which fish)

if test -z $ASDF_DATA_DIR
  set _asdf_shims "$HOME/.asdf/shims"
else
  set _asdf_shims "$ASDF_DATA_DIR/shims"
end

if not contains $_asdf_shims $PATH
  set -gx --prepend PATH $_asdf_shims
end
set --erase _asdf_shims

set -gx PATH $HOME/.local/share/aquaproj-aqua/bin $PATH
set -gx AQUA_GLOBAL_CONFIG $HOME/.config/aquaproj-aqua/aqua.yml

set -gx PATH $HOME/bin $PATH

if command -v direnv > /dev/null
  direnv hook fish | source
end

bind \cg peco_select_ghq_repository
bind \cr peco_select_history
