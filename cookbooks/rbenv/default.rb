node.reverse_merge!(
  rbenv: {
    user: node[:user],
    global: '2.7.2',
    versions: %w[
      2.7.2
    ]
  }
)

include_recipe 'rbenv::user'
