let
  fsRestrictions = ["nodev" "nosuid" "noexec"];
  root = "/dev/disk/by-uuid/80211811-0f30-403e-b992-4e65b4c27d53";
  boot = "/dev/disk/by-uuid/16C4-7E71";
  raid = "/dev/md/cloud:importantdata";
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
    "/var/lib/nextcloud/data" = {
      device = raid;
      fsType = "btrfs";
      options = fsRestrictions ++ ["subvolid=258" "autodefrag"];
    };
    "/media/hdd" = {
      device = "/dev/storage/data";
      fsType = "btrfs";
      options = fsRestrictions ++ ["autodefrag" "acl"];
    };
    "/media/backups" = {
      device = raid;
      fsType = "btrfs";
      options = fsRestrictions ++ ["subvolid=256" "autodefrag"];
    };
  };
  swapDevices = [];
  services.fstrim = {
    enable = true;
    interval = "05:00";
  };
}
