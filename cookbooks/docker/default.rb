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

execute 'install Docker Rootless mode' do
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
