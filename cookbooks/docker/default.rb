node.reverse_merge!(
  docker_compose: {
    version: '2.2.3'
  }
)

execute 'curl -fsSL https://get.docker.com/ | sh' do
  not_if 'which docker'
end

%w[
  docker.service
  docker.socket
].each do |svc|
  service svc do
    action [:disable, :stop]
  end
end

package 'uidmap'

execute "install Docker Rootless mode" do
  command <<-CMD
    export XDG_RUNTIME_DIR=/run/user/$(id -u #{node[:user]})
    dockerd-rootless-setuptool.sh install
  CMD
  user node[:user]
  not_if "test -d #{ENV['HOME']}/.docker"
end

execute 'docker context use rootless' do
  user node[:user]
  not_if 'docker context ls | grep "rootless \*"'
end

execute "mkdir #{ENV['HOME']}/.docker/cli-plugins" do
  user node[:user]
  not_if "test -d #{ENV['HOME']}/.docker/cli-plugins"
end

execute 'install Docker Compose' do
  command <<-CMD
    curl -o #{ENV['HOME']}/.docker/cli-plugins/docker-compose -fsSL https://github.com/docker/compose/releases/download/v#{node[:docker_compose][:version]}/docker-compose-linux-x86_64
    chmod +x #{ENV['HOME']}/.docker/cli-plugins/docker-compose
  CMD
  user node[:user]
  not_if "docker compose version | grep #{node[:docker_compose][:version]}"
end
