# frozen_string_literal: true

case node[:platform]
when 'darwin'
  package 'git-now'
when 'arch'
  aur_package 'git-now-git'
end
