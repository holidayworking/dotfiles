# frozen_string_literal: true

execute 'curl -fsSL https://get.docker.com/ | sh' do
  not_if 'which docker'
end

service 'docker' do
  action %i[enable start]
end

execute "usermod -aG docker #{node[:user]}" do
  not_if "groups #{node[:user]} | grep docker -w"
end
