# frozen_string_literal: true

include_role 'base'

include_cookbook 'homebrew'
include_cookbook 'aqua'
include_cookbook 'asdf'
include_cookbook 'docker'
include_cookbook 'fish'
include_cookbook 'git'
include_cookbook 'git-now'
include_cookbook 'lima'
include_cookbook 'tig'
include_cookbook 'tmux'

dotfile '.config/karabiner'
dotfile '.macos'

# execute "#{ENV.fetch('HOME', nil)}/.macos"
