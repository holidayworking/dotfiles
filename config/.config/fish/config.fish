if command -sq /usr/libexec/path_helper
  eval (env PATH='' /usr/libexec/path_helper -c)
end

set -g theme_display_date no

set -gx SHELL (which fish)

source ~/.asdf/asdf.fish

set -gx PATH $HOME/.local/share/aquaproj-aqua/bin $PATH
set -gx AQUA_GLOBAL_CONFIG $HOME/.config/aquaproj-aqua/aqua.yml

set -gx PATH $HOME/bin $PATH

if command -v direnv > /dev/null
  direnv hook fish | source
end

bind \cg peco_select_ghq_repository
bind \cr peco_select_history
