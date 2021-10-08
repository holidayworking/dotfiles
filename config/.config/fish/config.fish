if command -sq /usr/libexec/path_helper
  eval (env PATH='' /usr/libexec/path_helper -c)
end

set -g theme_display_date no

set -gx EDITOR vim

set -gx SHELL (which fish)

direnv hook fish | source

bind \cg peco_select_ghq_repository
bind \cr peco_select_history
