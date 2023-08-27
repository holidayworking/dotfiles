# frozen_string_literal: true

aur_package 'slack-desktop'

remote_file "/home/#{node[:user]}/.config/autostart/slack.desktop" do
  owner node[:user]
  group node[:user]
end
