aqua_bin_path = "#{node[:home]}/.local/share/aquaproj-aqua/bin/aqua"

execute 'install aqua' do
  user node[:user]
  command 'curl -sSfL https://raw.githubusercontent.com/aquaproj/aqua-installer/v0.7.0/aqua-installer | bash'
  not_if "test -f #{aqua_bin_path}"
end

dotfile '.aqua.yml'

execute 'install tools' do
  user node[:user]
  cwd node[:home]
  command "#{aqua_bin_path} install"
end
