# frozen_string_literal: true

include_recipe 'recipe_helper'

node.reverse_merge!(
  user: ENV['SUDO_USER'] || ENV.fetch('USER', nil)
)

include_role node[:platform]
