# frozen_string_literal: true

include_cookbook 'functions'

directory "#{ENV.fetch('HOME', nil)}/.config" do
  owner node[:user]
end
