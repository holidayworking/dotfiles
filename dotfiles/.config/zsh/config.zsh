if [[ -f $HOME/.config/zsh/override.zsh ]]; then
	source $HOME/.config/zsh/override.zsh
fi

export EDITOR=vim
export PROTO_HOME="$HOME/.proto"
export PATH="$PROTO_HOME/shims:$PROTO_HOME/bin:$PATH"

HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZE

setopt BANG_HIST
setopt EXTENDED_HISTORY
setopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt HIST_VERIFY
setopt HIST_BEEP

eval "$(sheldon source)"

setopt AUTO_MENU
setopt AUTO_LIST
zstyle ':completion:*:default' menu select=1

autoload -U compinit && compinit
autoload -U bashcompinit && bashcompinit
complete -C 'aws_completer' aws

eval "$(direnv hook zsh)"

eval "$(starship init zsh)"

for f in $HOME/.config/zsh/functions/*.zsh; do
	[ -f "$f" ] && source "$f"
done

bindkey '^g' peco_select_ghq_repository
bindkey '^r' peco_select_history
