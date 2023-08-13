# frozen_string_literal: true

package 'xdg-user-dirs-gtk'

execute 'LC_ALL=C xdg-user-dirs-update --force' do
  user node[:user]
end
