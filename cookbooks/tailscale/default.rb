# frozen_string_literal: true

package 'tailscale'

service 'tailscaled' do
  action %i[enable start]
end
