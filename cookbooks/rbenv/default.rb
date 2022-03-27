node.reverse_merge!(
  rbenv: {
    user: node[:user],
    global: '3.0.3',
    versions: %w[
      3.0.3
    ],
    scheme: 'https'
  }
)

include_recipe 'rbenv::user'
