# frozen_string_literal: true

home_path = ENV.fetch('HOME', nil)
aqua_bin_path = "#{home_path}/.local/share/aquaproj-aqua/bin/aqua"

execute 'install aqua' do
  user node[:user]
  command 'curl -fsSL https://raw.githubusercontent.com/aquaproj/aqua-installer/v3.1.0/aqua-installer | bash'
  not_if "test -f #{aqua_bin_path}"
end

dotfile '.config/aquaproj-aqua'

execute 'install tools' do
  user node[:user]
  cwd "#{home_path}/.config/aquaproj-aqua"
  command "#{aqua_bin_path} install"
end

execute 'copy tools' do
  user node[:user]
  cwd "#{home_path}/.config/aquaproj-aqua"
  command "#{aqua_bin_path} cp -o #{home_path}/bin jsonnetfmt"
end
