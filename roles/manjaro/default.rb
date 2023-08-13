# frozen_string_literal: true

include_role 'base'

include_cookbook 'yay'

include_cookbook '1password'
include_cookbook 'aqua'
include_cookbook 'asdf'
include_cookbook 'docker'
include_cookbook 'fish'
include_cookbook 'font'
include_cookbook 'git'
include_cookbook 'git-now'
include_cookbook 'hyper'
include_cookbook 'microsoft-edge'
include_cookbook 'mozc'
include_cookbook 'tailscale'
include_cookbook 'tig'
include_cookbook 'tmux'
include_cookbook 'ulauncher'
include_cookbook 'vim'
include_cookbook 'visual-studio-code'
include_cookbook 'xdg-user-dirs-gtk'
include_cookbook 'xremap'

dotfile '.manjaro'

execute "dbus-launch #{ENV.fetch('HOME', nil)}/.manjaro" do
  user node[:user]
end
