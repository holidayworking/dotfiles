include_role 'base'

include_cookbook 'homebrew'
include_cookbook 'fish'
include_cookbook 'git'
include_cookbook 'rbenv'
include_cookbook 'tig'
include_cookbook 'tmux'

dotfile '.macos'

execute "#{ENV['HOME']}/.macos"
