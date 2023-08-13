# frozen_string_literal: true

aur_package 'ulauncher'

dotfile '.config/ulauncher'

remote_file "#{ENV.fetch('HOME', nil)}/.config/autostart/ulauncher.desktop" do
  owner node[:user]
  group node[:user]
end
