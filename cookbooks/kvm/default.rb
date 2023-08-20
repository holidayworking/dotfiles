# frozen_string_literal: true

%w[
  dnsmasq
  edk2-ovmf
  libvirt
  qemu-desktop
  swtpm
  virt-manager
].each do |pkg|
  package pkg
end

aur_package 'virtio-win'

service 'libvirtd' do
  action %i[enable start]
end

execute "usermod -aG libvirt #{node[:user]}" do
  not_if "groups #{node[:user]} | grep libvirt -w"
end
