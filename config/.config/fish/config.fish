if not functions -q fisher
  set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
  curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
  fish -c fisher
end

if command -sq /usr/libexec/path_helper
  eval (env PATH='' /usr/libexec/path_helper -c)
end

set -gx EDITOR vim

set -gx SHELL (which fish)

direnv hook fish | source
hub alias | source

set -gx PATH $HOME/.nodenv/bin $PATH
status --is-interactive; and source (nodenv init -|psub)

set -gx PATH $HOME/.rbenv/bin $PATH
status --is-interactive; and source (rbenv init -|psub)

bind \c] peco_select_ghq_repository
bind \cr peco_select_history
