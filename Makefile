darwin/setup: homebrew/setup nix/install nix/darwin aqua/setup

homebrew/setup:
	@bash -c "$$(curl --fail --silent --show-error --location https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

nix/install:
	@curl --fail --silent --show-error --location https://install.determinate.systems/nix | sh -s -- install

nix/darwin:
	. /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh \
		&& sudo nix run nix-darwin/nix-darwin-25.05#darwin-rebuild -- switch --flake .#macbook-air-m2

nix/rebuild:
	@./scripts/nix-rebuild.sh

nix/gc:
	@nix-collect-garbage --delete-old

aqua/setup:
	@curl --fail --silent --show-error --location https://raw.githubusercontent.com/aquaproj/aqua-installer/v4.0.4/aqua-installer | bash

fish/setup:
	@fish -c "curl --fail --silent --show-error --location https://git.io/fisher | source && fisher update"

dotfiles/setup:
	@./scripts/dotfiles-setup.sh

lima/create:
	@limactl start --name=default --tty=false ./configs/lima/nixos.yaml

lima/bootstrap:
	@ssh taurus "\
		ssh-keygen -F github.com || ssh-keyscan github.com >> ~/.ssh/known_hosts && \
		mkdir -p ~/src/github.com/holidayworking && \
		cd ~/src/github.com/holidayworking && \
		git clone git@github.com:holidayworking/dotfiles.git && \
		cd dotfiles && \
		FLAKE_URI=.#macbook-air-m2-lima ./scripts/nix-rebuild.sh \
	"

vm/create:
	@./scripts/vm-create.sh

vm/bootstrap:
	@./scripts/vm-bootstrap.sh

renovate/dry-run:
	@LOG_LEVEL=debug RENOVATE_CONFIG_FILE=renovate.json pnpx renovate --dry-run --require-config=ignored --schedule= --token=$$(op read "op://Personal/GitHub Personal Access Token/token") holidayworking/dotfiles
