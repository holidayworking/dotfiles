# frozen_string_literal: true

PACKAGES = {
  'darwin' => %w[
    libyaml
    readline
    rust
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

home_path = ENV.fetch('HOME', nil)

arch = case node[:kernel][:machine]
       when 'aarch64'
         'arm64'
       when 'x86_64'
         'amd64'
       else
         node[:kernel][:machine]
       end

execute 'install asdf' do
  user node[:user]
  command <<~"CMD"
    curl -fsSL https://github.com/asdf-vm/asdf/releases/download/v0.16.3/asdf-v0.16.3-#{node[:os]}-#{arch}.tar.gz \
      | tar -xz -C #{home_path}/bin
  CMD
  not_if "test -f #{home_path}/bin/asdf"
end

%w[
  .asdfrc
  .tool-versions
].each do |file|
  dotfile file
end

asdf_init = <<~SHELL
  export PATH="#{home_path}/bin:${PATH}"
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
