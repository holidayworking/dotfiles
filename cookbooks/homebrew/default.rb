brew_dir = node['kernel']['machine'] == 'arm64' ? '/opt/homebrew' : '/usr/local'

execute 'install homebrew' do
  command 'NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"'
  not_if "which #{brew_dir}/bin/brew"
end

dotfile '.Brewfile' do
  source '.Brewfile.darwin'
end

execute "eval $(#{brew_dir}/bin/brew shellenv) && brew bundle install --global" do
  not_if "eval $(#{brew_dir}/bin/brew shellenv) && brew bundle check --global"
end
