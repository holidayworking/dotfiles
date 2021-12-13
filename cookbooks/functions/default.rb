node.reverse_merge!(
  os: run_command('uname').stdout.strip.downcase
)

define :dotfile, source: nil do
  source = params[:source] || params[:name]
  link File.join(ENV['HOME'], params[:name]) do
    user node[:user]
    to File.expand_path("../../../config/#{source}", __FILE__)
    not_if "test -f #{File.join(ENV['HOME'], params[:name])}"
  end
end
