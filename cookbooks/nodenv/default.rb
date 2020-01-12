node.reverse_merge!(
  nodenv: {
    user: node[:user],
    global: '12.14.1',
    versions: %w[
      12.14.1
    ],
  }
)

include_recipe 'nodenv::user'
