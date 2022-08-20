# frozen_string_literal: true

package 'fish'

if node[:os] == 'linux' && !devcontainer?
  execute "echo 'exec /usr/bin/fish' >> #{ENV.fetch('HOME', nil)}/.bashrc" do
    user node[:user]
    not_if "grep '^exec /usr/bin/fish' #{ENV.fetch('HOME', nil)}/.bashrc"
  end
end

dotfile '.config/fish'
