let
  root = "/dev/disk/by-uuid/80211811-0f30-403e-b992-4e65b4c27d53";
  boot = "/dev/disk/by-uuid/16C4-7E71";
in {
  boot.extraModprobeConfig = ''
    options zfs zfs_nopwrite_enabled=1
  '';
  boot.zfs = {
    devNodes = "/dev/disk/by-vdev";
    extraPools = [
      "filestorage"
      "raid"
    ];
  };
  environment.etc."zfs/vdev_id.conf".text = ''
    alias	filestorage-1	/dev/disk/by-id/ata-WDC_WD40PURZ-85AKKY0_WD-WX92DA1J6F7U
    alias	reflection-1	/dev/disk/by-id/ata-WDC_WD20EZRZ-00Z5HB0_WD-WCC4M0ZVFACK
    alias	reflection-2	/dev/disk/by-id/ata-WDC_WD20EFZX-68AWUN0_WD-WXA2A138C296
  '';
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
