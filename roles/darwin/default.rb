include_role 'base'

include_cookbook 'homebrew'
include_cookbook 'fish'
include_cookbook 'git'
include_cookbook 'tig'
include_cookbook 'tmux'

dotfile '.config/karabiner'
dotfile '.macos'

execute "#{ENV['HOME']}/.macos"
