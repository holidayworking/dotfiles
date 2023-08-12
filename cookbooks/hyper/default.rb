# frozen_string_literal: true

case node[:platform]
when 'darwin'
  package 'hyper'
when 'arch'
  aur_package 'hyper-bin'
end

template "#{ENV.fetch('HOME', nil)}/.hyper.js" do
  owner node[:user]
  group node[:platform] == 'darwin' ? 'staff' : node[:user]
end
