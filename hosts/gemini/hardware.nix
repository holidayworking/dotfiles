{
  delib,
  inputs,
  pkgs-master,
  ...
}:
delib.host {
  name = "gemini";

  nixos = {
    imports = [
      inputs.disko.nixosModules.disko
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

    hardware.parallels = {
      enable = true;
      package = pkgs-master.prl-tools;
    };

    nix.settings = {
      extra-platforms = [ "x86_64-linux" ];
      extra-sandbox-paths = [
        "/run/binfmt"
        "/mnt/psf/RosettaLinux"
      ];
    };

    # Re-enable the prlcp user service. It was removed in https://github.com/NixOS/nixpkgs/pull/438941.
    # In this environment, prlcc does not start prlcp automatically,
    # so we start it explicitly to enable clipboard support.
    systemd.user.services.prlcp = {
      description = "Parallels Copy Paste Tool";
      wantedBy = [ "graphical-session.target" ];
      path = [ pkgs-master.prl-tools ];
      serviceConfig = {
        ExecStart = "${pkgs-master.prl-tools}/bin/prlcp";
        Restart = "always";
        WorkingDirectory = "${pkgs-master.prl-tools}/bin";
      };
    };
  };
}
