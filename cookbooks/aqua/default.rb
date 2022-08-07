aqua_bin_path = "#{ENV['HOME']}/.local/share/aquaproj-aqua/bin/aqua"

execute 'install aqua' do
  user node[:user]
  command 'curl -fsSL https://raw.githubusercontent.com/aquaproj/aqua-installer/v1.1.1/aqua-installer | bash'
  not_if "test -f #{aqua_bin_path}"
end

dotfile '.config/aquaproj-aqua'

execute 'install tools' do
  user node[:user]
  cwd "#{ENV['HOME']}/.config/aquaproj-aqua"
  command "#{aqua_bin_path} install"
end
