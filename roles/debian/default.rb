# frozen_string_literal: true

include_role 'base'

include_cookbook 'apt'
include_cookbook 'aqua'
include_cookbook 'asdf'
include_cookbook 'docker' unless devcontainer?
include_cookbook 'fish'
include_cookbook 'git'
include_cookbook 'git-now'
include_cookbook 'tig'
include_cookbook 'tmux'
include_cookbook 'vim'
