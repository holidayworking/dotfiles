{
  config,
  inputs,
  ...
}:
{
  flake.modules.nixos."hosts/gemini" =
    { pkgs, lib, ... }:
    let
      username = "hidekazu";
    in
    {
      imports =
        with config.flake.modules.nixos;
        [
          inputs.disko.nixosModules.disko

          base
          shell
          hidekazu
        ]
        ++ [
          {
            home-manager = {
              users.${username} = {
                imports = with config.flake.modules.homeManager; [
                  base
                  shell
                  development
                ];
              };
            };
          }
        ];

      boot = {
        binfmt.registrations.RosettaLinux = {
          fixBinary = true;
          interpreter = "/mnt/psf/RosettaLinux/rosetta";
          magicOrExtension = ''\x7fELF\x02\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x3e\x00'';
          mask = ''\xff\xff\xff\xff\xff\xfe\xfe\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff'';
          matchCredentials = true;
          preserveArgvZero = false;
          wrapInterpreterInShell = false;
        };

        initrd.availableKernelModules = [
          "ehci_pci"
          "xhci_pci"
          "usbhid"
          "sr_mod"
        ];

        loader = {
          efi.canTouchEfiVariables = true;
          systemd-boot.enable = true;
        };
      };

      disko.devices = {
        disk = {
          main = {
            device = "/dev/sda";
            type = "disk";
            content = {
              type = "gpt";
              partitions = {
                ESP = {
                  type = "EF00";
                  size = "500M";
                  content = {
                    type = "filesystem";
                    format = "vfat";
                    mountpoint = "/boot";
                    mountOptions = [ "umask=0077" ];
                  };
                };
                root = {
                  size = "100%";
                  content = {
                    type = "filesystem";
                    format = "ext4";
                    mountpoint = "/";
                  };
                };
              };
            };
          };
        };
      };

      environment.sessionVariables = {
        PATH = [ "$HOME/.local/share/aquaproj-aqua/bin" ];
      };

      hardware.parallels.enable = true;

      networking.useDHCP = true;

      nix.settings = {
        extra-platforms = [ "x86_64-linux" ];
        extra-sandbox-paths = [
          "/run/binfmt"
          "/mnt/psf/RosettaLinux"
        ];
      };

      nixpkgs = {
        config.allowUnfree = true;
        hostPlatform = "aarch64-linux";

        overlays = [
          inputs.self.overlays.default
        ];
      };

      services.openssh.enable = true;

      users.users.${username}.openssh.authorizedKeys.keys =
        config.flake.meta.users.${username}.authorizedKeys;
    };
}
