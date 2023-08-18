# frozen_string_literal: true

package 'dconf-editor'

%w[
  gnome-shell-extension-pano
  gnome-shell-extension-search-light-git
].each do |pkg|
  aur_package pkg
end
