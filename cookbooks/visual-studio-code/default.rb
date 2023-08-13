# frozen_string_literal: true

case node[:platform]
when 'darwin'
  package 'visual-studio-code'
when 'arch'
  aur_package 'visual-studio-code-bin'
end
