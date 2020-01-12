include_role 'base'

include_cookbook 'homebrew'
include_cookbook 'fish'
include_cookbook 'git'
include_cookbook 'nodenv'
include_cookbook 'rbenv'
include_cookbook 'tig'
include_cookbook 'tmux'

dotfile '.atom'
dotfile '.config/karabiner'
dotfile '.macos'

execute "#{ENV['HOME']}/.macos"

execute "cp -f /usr/local/opt/ricty/share/fonts/Ricty*.ttf #{ENV['HOME']}/Library/Fonts && fc-cache -vf" do
  not_if "test -f #{ENV['HOME']}/Library/Fonts/Ricty-Bold.ttf"
end

%w[sahara vagrant-hostsupdater vagrant-vbguest].each do |plugin|
  vagrant_plugin plugin
end
