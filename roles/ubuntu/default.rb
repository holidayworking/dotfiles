include_role 'base'

include_cookbook 'linuxbrew'
include_cookbook 'docker' unless wsl?
include_cookbook 'fish'
include_cookbook 'git'
include_cookbook 'rbenv'
include_cookbook 'tig'
include_cookbook 'tmux'
