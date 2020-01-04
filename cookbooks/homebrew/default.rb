execute 'install homebrew' do
  command '/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" < /dev/null'
  not_if 'which brew'
end

dotfile '.Brewfile' do
  source '.Brewfile.darwin'
end

execute 'brew bundle install --global' do
  not_if 'brew bundle check --global'
end
