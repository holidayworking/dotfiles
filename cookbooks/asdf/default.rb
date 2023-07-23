# frozen_string_literal: true

case node[:platform]
when 'darwin'
  %w[
    readline
    libyaml
  ].each do |pkg|
    package pkg
  end
when 'ubuntu'
  %w[
    autoconf
    bison
    build-essential
    git
    libdb-dev
    libffi-dev
    libgdbm-dev
    libgdbm6
    libncurses5-dev
    libreadline-dev
    libssl-dev
    libyaml-dev
    unzip
    uuid-dev
    zlib1g-dev
  ].each do |pkg|
    package pkg
  end
end

asdf_root = "#{ENV.fetch('HOME', nil)}/.asdf"

git asdf_root do
  repository 'https://github.com/asdf-vm/asdf.git'
  user node[:user]
end

%w[
  .asdfrc
  .tool-versions
].each do |file|
  dotfile file
end

asdf_init = <<~SHELL
  export PATH="#{asdf_root}/bin:${PATH}"
SHELL

%w[
  awscli
  nodejs
  ruby
  python
].each do |plugin|
  execute "install #{plugin} plugin" do
    user node[:user]
    command "#{asdf_init} asdf plugin add #{plugin}"
    not_if "#{asdf_init} asdf plugin list | grep '^#{plugin}$'"
  end
end

execute 'install tools' do
  user node[:user]
  command "#{asdf_init} asdf install"
end
