# frozen_string_literal: true

node.reverse_merge!(
  os: run_command('uname').stdout.strip.downcase
)

define :dotfile, source: nil do
  source = params[:source] || params[:name]
  link File.join(ENV.fetch('HOME', nil), params[:name]) do
    user node[:user]
    to File.expand_path("../../../config/#{source}", __FILE__)
    not_if "test -f #{File.join(ENV.fetch('HOME', nil), params[:name])}"
  end
end
