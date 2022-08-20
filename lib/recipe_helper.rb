# frozen_string_literal: true

MItamae::RecipeContext.class_eval do
  def include_cookbook(name)
    root_dir = File.expand_path('../..', __FILE__)
    include_recipe File.join(root_dir, 'cookbooks', name, 'default')
  end

  def include_role(name)
    root_dir = File.expand_path('../..', __FILE__)
    include_recipe File.join(root_dir, 'roles', name, 'default')
  end

  def codespaces?
    ENV['CODESPACES'] == 'true'
  end

  def remote_containers?
    ENV['REMOTE_CONTAINERS'] == 'true'
  end

  def devcontainer?
    codespaces? || remote_containers?
  end
end
