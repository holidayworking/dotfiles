darwin/setup: nix/install nix/darwin aqua/setup

homebrew/setup:
	@bash -c "$$(curl --fail --silent --show-error --location https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

nix/install:
	@curl --fail --silent --show-error --location https://install.determinate.systems/nix | sh -s -- install --prefer-upstream-nix

nix/darwin:
	. /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh \
		&& sudo nix run nix-darwin/master#darwin-rebuild -- switch --flake .#aries

nix/rebuild:
	@./scripts/nix-rebuild.sh

nix/clean:
	@nh clean all --ask

aqua/setup:
	@curl --fail --silent --show-error --location https://raw.githubusercontent.com/aquaproj/aqua-installer/v4.0.4/aqua-installer | bash

fish/setup:
	@fish -c "curl --fail --silent --show-error --location https://git.io/fisher | source && fisher update"

dotfiles/setup:
	@./scripts/dotfiles-setup.sh

vm/create:
	@./scripts/vm-create.sh

vm/bootstrap:
	@./scripts/vm-bootstrap.sh

renovate/dry-run:
	@LOG_LEVEL=debug RENOVATE_CONFIG_FILE=renovate.json pnpx renovate --dry-run --require-config=ignored --schedule= --token=$$(op read "op://Personal/GitHub Personal Access Token/token") holidayworking/dotfiles
