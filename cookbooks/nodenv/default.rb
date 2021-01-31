node.reverse_merge!(
  nodenv: {
    user: node[:user],
    global: '14.15.0',
    versions: %w[
      14.15.0
    ],
  }
)

include_recipe 'nodenv::user'
