node.reverse_merge!(
  docker_compose: {
    version: '2.2.3'
  }
)

execute 'curl -sSL https://get.docker.com/ | sh' do
  not_if 'which docker'
end

service 'docker' do
  action [:enable, :start]
end

execute "usermod -aG docker #{node[:user]}" do
  not_if "groups #{node[:user]} | grep docker -w"
end

execute 'mkdir -p /usr/local/lib/docker/cli-plugins' do
  not_if 'test -d /usr/local/lib/docker/cli-plugins'
end

execute 'install docker-compose' do
  command <<-CMD
    curl -SL https://github.com/docker/compose/releases/download/v#{node[:docker_compose][:version]}/docker-compose-linux-x86_64 -o /usr/local/lib/docker/cli-plugins/docker-compose \
    && chmod +x /usr/local/lib/docker/cli-plugins/docker-compose
  CMD
  not_if "docker compose version | grep #{node[:docker_compose][:version]}"
end
