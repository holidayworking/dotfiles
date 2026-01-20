set -gx EDITOR (which vim)
set -gx SHELL (which fish)
set -gx PROTO_HOME "$HOME/.proto"

if test -d /opt/homebrew/bin; and not contains /opt/homebrew/bin $PATH
    fish_add_path /opt/homebrew/bin
end

fish_add_path $HOME/bin $PROTO_HOME/shims $PROTO_HOME/bin $HOME/.local/share/aquaproj-aqua/bin

if type -q brew
    if test -d (brew --prefix)"/share/fish/completions"
        set -p fish_complete_path (brew --prefix)/share/fish/completions
    end

    if test -d (brew --prefix)"/share/fish/vendor_completions.d"
        set -p fish_complete_path (brew --prefix)/share/fish/vendor_completions.d
    end
end

if type -q direnv
    direnv hook fish | source
end

bind \cg peco_select_ghq_repository
bind \cr peco_select_history

if test -f $HOME/.config/fish/override.fish
    source $HOME/.config/fish/override.fish
end

starship init fish | source
