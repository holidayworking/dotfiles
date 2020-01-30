node.reverse_merge!(
  os: run_command('uname').stdout.strip.downcase
)

define :dotfile, source: nil do
  source = params[:source] || params[:name]
  link File.join(ENV['HOME'], params[:name]) do
    user node[:user]
    to File.expand_path("../../../config/#{source}", __FILE__)
  end
end

define :vagrant_plugin do
  execute "vagrant plugin install #{params[:name]}" do
    user node[:user]
    not_if "vagrant plugin list | grep #{params[:name]}"
  end
end

define :vscode_extension do
  execute "code --install-extension #{params[:name]}" do
    user node[:user]
    not_if "code --list-extensions | grep #{params[:name]}"
  end
end
