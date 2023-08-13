# frozen_string_literal: true

case node[:platform]
when 'darwin'
  package '1password'
when 'arch'
  aur_package '1password'

  remote_file "/home/#{node[:user]}/.config/autostart/1password.desktop" do
    owner node[:user]
    group node[:user]
  end
end
