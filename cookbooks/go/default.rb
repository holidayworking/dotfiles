# frozen_string_literal: true

case node[:platform]
when 'darwin'
  package 'go'
when 'debian'
  package 'golang'
when 'ubuntu'
  apt_repository 'golang-backports' do
    url 'ppa:longsleep/golang-backports'
  end

  package 'golang'
end
