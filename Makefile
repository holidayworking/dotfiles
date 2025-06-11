setup: nix-setup aqua-setup fish-setup

nix-setup: nix-install nix-darwin

nix-install:
	@curl --fail --silent --show-error --location https://install.determinate.systems/nix | sh -s -- install

nix-darwin:
	@. /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
	@sudo nix run nix-darwin/nix-darwin-25.05#darwin-rebuild -- switch --flake .#jasper

nix-rebuild:
	@sudo darwin-rebuild switch --flake .#macbook-air-m2

nix-gc:
	@nix-collect-garbage --delete-old

aqua-setup:
	@curl --fail --silent --show-error --location https://raw.githubusercontent.com/aquaproj/aqua-installer/v3.1.2/aqua-installer | bash

fish-setup:
	@fish -c "curl --fail --silent --show-error --location https://git.io/fisher | source && fisher update"

dotfiles-link:
	@./scripts/dotfiles-link.sh
