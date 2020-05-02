node.reverse_merge!(
  rbenv: {
    user: node[:user],
    global: '2.6.6',
    versions: %w[
      2.4.4
      2.5.0
      2.6.6
    ]
  }
)

include_recipe 'rbenv::user'
