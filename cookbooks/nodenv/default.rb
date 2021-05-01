node.reverse_merge!(
  nodenv: {
    user: node[:user],
    global: '14.16.1',
    versions: %w[
      14.16.1
    ],
  },
  'nodenv-default-packages': {
    'default-packages': [
      'corepack 0.6.0'
    ]
  }
)

include_recipe 'nodenv::user'

git "#{node[:nodenv][:nodenv_root]}/plugins/nodenv-default-packages" do
  repository "#{node[:nodenv][:scheme]}://github.com/nodenv/nodenv-default-packages.git"
  user node[:nodenv][:user]
end

file "#{node[:nodenv][:nodenv_root]}/default-packages" do
  content node[:'nodenv-default-packages'][:'default-packages'].join("\n") + "\n"
  mode    '664'
  owner node[:nodenv][:user]
  group node[:nodenv][:user]
end

nodenv_init = <<-EOS
  export NODENV_ROOT=#{node[:nodenv][:nodenv_root]}
  export PATH="#{node[:nodenv][:nodenv_root]}/bin:${PATH}"
  eval "$(nodenv init -)"
EOS

execute "nodenv default-packages install --all}" do
  command "#{nodenv_init} nodenv default-packages install --all"
  user node[:nodenv][:user]
end
