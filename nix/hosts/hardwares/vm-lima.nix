{
  modulesPath,
  pkgs,
  lib,
  lima-init,
  ...
}:
{
  imports = [
    (modulesPath + "/profiles/qemu-guest.nix")
    lima-init.nixosModules.lima
  ];

  boot = {
    kernelParams = [ "console=tty0" ];

    loader.grub = {
      device = "nodev";
      efiSupport = true;
      efiInstallAsRemovable = true;
    };
  };

  fileSystems = {
    "/boot" = {
      device = lib.mkForce "/dev/vda1";
      fsType = "vfat";
    };

    "/" = {
      device = "/dev/disk/by-label/nixos";
      autoResize = true;
      fsType = "ext4";
      options = [
        "discard"
        "noatime"
        "nodiratime"
      ];
    };
  };

  services.lima.enable = true;

  virtualisation.rosetta = {
    enable = true;
    mountTag = "vz-rosetta";
  };
}
