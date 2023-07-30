# frozen_string_literal: true

%w[git git-lfs].each do |pkg|
  package pkg
end

dotfile '.gitconfig'
dotfile '.gitignore_global'
