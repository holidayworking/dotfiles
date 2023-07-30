# frozen_string_literal: true

case node[:platform]
when 'arch'
  %w[docker docker-compose].each do |pkg|
    package pkg
  end
when 'ubuntu'
  execute 'curl -fsSL https://get.docker.com/ | sh' do
    not_if 'which docker'
  end
end

service 'docker' do
  action %i[enable start]
end

execute "usermod -aG docker #{node[:user]}" do
  not_if "groups #{node[:user]} | grep docker -w"
end
