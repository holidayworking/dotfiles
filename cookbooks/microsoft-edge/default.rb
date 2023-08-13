# frozen_string_literal: true

case node[:platform]
when 'darwin'
  package 'microsoft-edge'
when 'arch'
  aur_package 'microsoft-edge-stable-bin'
end
