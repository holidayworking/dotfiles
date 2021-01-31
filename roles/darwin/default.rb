include_role 'base'

include_cookbook 'homebrew'
include_cookbook 'fish'
include_cookbook 'git'
include_cookbook 'nodenv'
include_cookbook 'rbenv'
include_cookbook 'tig'
include_cookbook 'tmux'

dotfile '.config/karabiner'
dotfile '.macos'

execute "#{ENV['HOME']}/.macos"

%w[sahara vagrant-hostsupdater vagrant-notify-forwarder vagrant-vbguest].each do |plugin|
  vagrant_plugin plugin
end
