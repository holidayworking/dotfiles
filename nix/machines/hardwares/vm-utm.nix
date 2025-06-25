{
  boot = {
    extraModulePackages = [ ];
    kernelModules = [ ];

    initrd = {
      availableKernelModules = [
        "usb_storage"
        "usbhid"
        "virtio_pci"
        "xhci_pci"
      ];
      kernelModules = [ ];
    };

    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = true;
    };
  };

  disko.devices = {
    disk = {
      main = {
        device = "/dev/vda";
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

  networking.interfaces.enp0s1.useDHCP = true;
}
