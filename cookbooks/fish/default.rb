dotfile '.config/fish'

if node[:os] == 'linux'
  execute "echo 'exec /home/linuxbrew/.linuxbrew/bin/fish' >> #{ENV['HOME']}/.bash_profile" do
    user node[:user]
    not_if "grep '^exec /home/linuxbrew/.linuxbrew/bin/fish' #{ENV['HOME']}/.bash_profile"
  end
end
