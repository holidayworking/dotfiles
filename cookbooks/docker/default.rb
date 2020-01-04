node.reverse_merge!(
  docker: {
    users: [
      node[:user]
    ]
  }
)

include_recipe 'docker::install'
