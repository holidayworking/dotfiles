node.reverse_merge!(
  rbenv: {
    user: node[:user],
    global: '3.0.1',
    versions: %w[
      3.0.1
    ]
  }
)

include_recipe 'rbenv::user'
