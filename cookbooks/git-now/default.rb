case node[:os]
when 'darwin'
  package 'git-now'
when 'linux'
  git '/usr/local/src/git-now' do
    repository 'https://github.com/iwata/git-now.git'
    recursive true
    notifies :run, 'execute[install git-now]'
  end

  execute "install git-now" do
    cwd '/usr/local/src/git-now'
    command 'make install'
    action :nothing
  end
end