node.reverse_merge!(
  nodenv: {
    user: node[:user],
    global: '16.13.0',
    versions: %w[
      16.13.0
    ],
    scheme: 'https'
  }
)

include_recipe 'nodenv::user'
