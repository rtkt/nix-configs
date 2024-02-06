let fsRestrictions = [ "nodev" "nosuid" "noexec" ]; in
{
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/80211811-0f30-403e-b992-4e65b4c27d53";
      fsType = "btrfs";
    };
    "/var/lib/nextcloud/data/root/files" = {
      device = "/dev/disk/by-uuid/9d1be106-3e62-49e4-9bd8-7e888d995d6f";
      fsType = "btrfs";
      options = fsRestrictions ++ [ "subvolid=258" ];
    };
  };
  swapDevices = [];
}
