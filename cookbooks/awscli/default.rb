case node[:os]
when 'darwin'
  package 'awscli'
when 'linux'
  execute 'install awscli' do
    cwd '/tmp'
    command <<-EOS
      curl --output awscliv2.zip https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip
      unzip awscliv2.zip
      ./aws/install
      rm awscliv2.zip
    EOS
    not_if 'command -v aws'
  end
end
