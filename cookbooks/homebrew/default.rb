# frozen_string_literal: true

execute 'install homebrew' do
  command 'NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"'
  not_if 'which brew'
end

dotfile '.Brewfile' do
  source '.Brewfile'
end

execute 'brew bundle install --global' do
  not_if 'brew bundle check --global'
end
