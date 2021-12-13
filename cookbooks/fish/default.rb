package 'fish'

if node[:os] == 'linux' && !devcontainer?
  execute "echo 'exec /usr/bin/fish' >> #{ENV['HOME']}/.bashrc" do
    user node[:user]
    not_if "grep '^exec /usr/bin/fish' #{ENV['HOME']}/.bashrc"
  end
end

dotfile '.config/fish'
