package 'build-essential'

execute 'install linuxbrew' do
  user node[:user]
  command '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" < /dev/null'
  not_if 'test -d /home/linuxbrew'
end

dotfile '.Brewfile' do
  source '.Brewfile.linux'
end

execute 'eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv) && brew bundle install --global' do
  user node[:user]
  not_if 'eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv) && brew bundle check --global'
end
