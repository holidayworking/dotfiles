# frozen_string_literal: true

aur_package 'xremap-x11-bin'

execute "usermod -aG input #{node[:user]}" do
  not_if "groups #{node[:user]} | grep input -w"
end

%w[
  /etc/modules-load.d/uinput.conf
  /etc/udev/rules.d/99-input.rules
].each do |file|
  remote_file file
end

directory "#{ENV.fetch('HOME', nil)}/.config/systemd/user" do
  owner node[:user]
  group node[:user]
end

[
  "#{ENV.fetch('HOME', nil)}/.config/autostart/xremap.desktop",
  "#{ENV.fetch('HOME', nil)}/.config/systemd/user/xremap.service"
].each do |file|
  remote_file file do
    owner node[:user]
    group node[:user]
  end
end

dotfile '.config/xremap'
