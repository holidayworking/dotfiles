include_cookbook 'functions'

directory "#{ENV['HOME']}/.config" do
  owner node[:user]
end
