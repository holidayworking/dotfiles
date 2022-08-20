# frozen_string_literal: true

package 'git'

dotfile '.gitconfig' unless remote_containers?
dotfile '.gitignore_global'
