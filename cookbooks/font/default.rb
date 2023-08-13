# frozen_string_literal: true

PACKAGES = {
  'darwin' => %w[font-fira-code],
  'arch' => %w[
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    ttf-fira-code
    ttf-inconsolata
  ]
}.freeze

PACKAGES[node[:platform]].each do |pkg|
  package pkg
end

dotfile '.config/fontconfig'
