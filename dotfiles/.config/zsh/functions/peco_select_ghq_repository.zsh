function peco_select_ghq_repository() {
	local line
	line=$(ghq list | peco --query "$LBUFFER")
	if [[ -n "$line" ]]; then
		cd "$(ghq list --full-path --exact "$line")" || return
		zle reset-prompt
	fi
}

zle -N peco_select_ghq_repository
