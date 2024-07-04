let
  root = "/dev/disk/by-uuid/80211811-0f30-403e-b992-4e65b4c27d53";
  boot = "/dev/disk/by-uuid/16C4-7E71";
in {
  fileSystems = {
    "/" = {
      device = root;
      fsType = "btrfs";
      options = [
        "defaults"
        "relatime"
      ];
    };
    "/boot" = {
      device = boot;
      fsType = "vfat";
      options = ["umask=177" "dmask=077" "uid=0" "gid=0"];
    };
  };
  swapDevices = [];
  services.fstrim = {
    enable = true;
    interval = "05:00";
  };
}
