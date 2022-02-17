include_role 'base'

include_cookbook 'apt'

unless devcontainer?
  include_cookbook 'docker'
  include_cookbook 'nodenv'
  include_cookbook 'rbenv'
end

include_cookbook 'aqua'
include_cookbook 'fish'
include_cookbook 'git'
include_cookbook 'git-now'
include_cookbook 'tig'
include_cookbook 'tmux'
include_cookbook 'vim'
