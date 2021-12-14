if command -sq /usr/libexec/path_helper
  eval (env PATH='' /usr/libexec/path_helper -c)
end

set -g theme_display_date no

set -gx SHELL (which fish)

if command -v direnv > /dev/null
  direnv hook fish | source
end

if command -v nodenv > /dev/null
  set -gx PATH $HOME/.nodenv/bin $PATH
  status --is-interactive; and source (nodenv init -|psub)
end

if command -v rbenv > /dev/null
  set -gx PATH $HOME/.rbenv/bin $PATH
  status --is-interactive; and source (rbenv init -|psub)
end

bind \cg peco_select_ghq_repository
bind \cr peco_select_history
