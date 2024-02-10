let
  fsRestrictions = ["nodev" "nosuid" "noexec"];
  root = "/dev/disk/by-uuid/80211811-0f30-403e-b992-4e65b4c27d53";
  raid = "/dev/md/cloud:importantdata";
  hdd = "/dev/disk/by-uuid/9d1be106-3e62-49e4-9bd8-7e888d995d6f";
in {
  fileSystems = {
    "/" = {
      device = root;
      fsType = "btrfs";
      options = [
        "defaults"
        "noatime"
      ];
    };
    "/var/lib/nextcloud/data" = {
      device = raid;
      fsType = "btrfs";
      options = fsRestrictions ++ ["subvolid=258"];
    };
    "/media/hdd" = {
      device = hdd;
      fsType = "btrfs";
      options = fsRestrictions;
    };
    "/media/backups" = {
      device = raid;
      fsType = "btrfs";
      options = fsRestrictions ++ ["subvolid=256"];
    };
  };
  swapDevices = [];
  services.fstrim = {
    enable = true;
    interval = "05:00";
  };
}
