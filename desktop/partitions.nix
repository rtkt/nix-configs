{
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/nixos";
      fsType = "btrfs";
    };
    "/home" = {
      device = "/dev/disk/by-label/home";
      fsType = "btrfs";
    };
  };
  swapDevices = [{device = "/dev/disk/by-label/swap";}];
}
