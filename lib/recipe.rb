# frozen_string_literal: true

include_recipe 'recipe_helper'

node.reverse_merge!(
  user: ENV['SUDO_USER'] || ENV.fetch('USER', nil)
)

platform =
  if node[:platform] == 'arch' && run_command('cat /etc/arch-release').stdout.chomp == 'Manjaro Linux'
    'manjaro'
  else
    node[:platform]
  end

include_role platform
