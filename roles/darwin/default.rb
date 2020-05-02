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

%w[sahara vagrant-hostsupdater vagrant-notify-forwarder vagrant-vbguest].each do |plugin|
  vagrant_plugin plugin
end

directory "#{ENV['HOME']}/Library/Application Support/Code/User" do
  user node[:user]
end

link "#{ENV['HOME']}/Library/Application Support/Code/User/settings.json" do
  user node[:user]
  to File.expand_path("../../../config/vscode/settings.json", __FILE__)
end

%w[
  GitHub.github-vscode-theme
  GitHub.vscode-pull-request-github
  Tyriar.sort-lines
  VisualStudioExptTeam.vscodeintellicode
  aki77.rails-db-schema
  amazonwebservices.aws-toolkit-vscode
  christian-kohler.path-intellisense
  donjayamanne.githistory
  eamodio.gitlens
  formulahendry.auto-close-tag
  kaiwood.endwise
  mike-co.import-sorter
  ms-azuretools.vscode-docker
  ms-vscode-remote.remote-containers
  ms-vscode-remote.remote-ssh
  ms-vscode-remote.remote-ssh-edit
  ms-vscode-remote.remote-wsl
  ms-vscode-remote.vscode-remote-extensionpack
  octref.vetur
  pmneo.tsimporter
  rebornix.ruby
  sianglim.slim
  sporto.rails-go-to-spec
  streetsidesoftware.code-spell-checker
  stringham.move-ts
  vscode-icons-team.vscode-icons
  wingrunr21.vscode-ruby
].each do |extension|
  vscode_extension extension
end
