# frozen_string_literal: true

PACKAGES = {
  'darwin' => %w[
    libyaml
    readline
    rust
  ],
  'arch' => %w[
    base-devel
    libffi
    libyaml
    openssl
    rust
    unzip
    zlib
  ],
  'ubuntu' => %w[
    build-essential
    libffi-dev
    libgdbm-dev
    libgdbm6
    libgmp-dev
    libncurses5-dev
    libreadline-dev
    libssl-dev
    libyaml-dev
    rustc
    unzip
    zlib1g-dev
  ]
}.freeze

PACKAGES[node[:platform]].each do |pkg|
  package pkg
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
