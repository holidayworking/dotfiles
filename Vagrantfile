Vagrant.configure('2') do |config|
  config.vm.box = 'bento/ubuntu-18.04'

  config.vm.network 'private_network', ip: '192.168.33.10'
  config.vm.hostname = 'devbox'

  config.vm.synced_folder "#{Dir.home}/src", '/home/vagrant/src', type: 'nfs',
                                                                  mount_options: ['rw', 'vers=3', 'tcp'],
                                                                  linux__nfs_options: %w[rw no_subtree_check all_squash async]

  config.vm.provider 'virtualbox' do |vb|
    vb.cpus = 2
    vb.memory = 4096
    vb.customize ['modifyvm', :id, '--natdnshostresolver1', 'on']
    vb.customize ['modifyvm', :id, '--natdnsproxy1', 'on']
  end

  config.ssh.forward_agent = true
end
