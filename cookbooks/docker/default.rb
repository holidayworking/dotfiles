# frozen_string_literal: true

PACKAGES = {
  'darwin' => %w[orbstack],
  'arch' => %w[docker docker-compose]
}.freeze

PACKAGES[node[:platform]].each do |pkg|
  package pkg
end

unless node[:platform] == 'darwin'
  service 'docker' do
    action %i[enable start]
  end

  execute "usermod -aG docker #{node[:user]}" do
    not_if "groups #{node[:user]} | grep docker -w"
  end
end
