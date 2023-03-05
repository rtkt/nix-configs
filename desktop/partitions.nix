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
    "/home/rtkt/Видео" = {
      device = "/dev/disk/by-uuid/9d1be106-3e62-49e4-9bd8-7e888d995d6f";
      fsType = "btrfs";
      depends = ["/home"];
      options = [
        "nodev"
        "nosuid"
        "subvolid=256"
      ];
    };
    "/home/rtkt/Музыка" = {
      device = "/dev/disk/by-uuid/9d1be106-3e62-49e4-9bd8-7e888d995d6f";
      fsType = "btrfs";
      depends = ["/home"];
      options = [
        "nodev"
        "nosuid"
        "noexec"
        "subvolid=257"
      ];
    };
    "/home/rtkt/Документы" = {
      device = "/dev/disk/by-uuid/afccf2a6-08ab-4260-a55a-ea44e8c25bb6";
      fsType = "btrfs";
      depends = ["/home"];
      options = [
        "nodev"
        "nosuid"
        "noexec"
        "subvolid=754"
      ];
    };
    "/home/rtkt/Загрузки" = {
      device = "/dev/disk/by-uuid/afccf2a6-08ab-4260-a55a-ea44e8c25bb6";
      fsType = "btrfs";
      depends = ["/home"];
      options = [
        "nodev"
        "nosuid"
        "noexec"
        "subvolid=753"
      ];
    };
    "/home/rtkt/Игры" = {
      device = "/dev/disk/by-uuid/afccf2a6-08ab-4260-a55a-ea44e8c25bb6";
      fsType = "btrfs";
      depends = ["/home"];
      options = [
        "nodev"
        "nosuid"
        "noexec"
        "subvolid=755"
      ];
    };
    "/home/rtkt/Изображения" = {
      device = "/dev/disk/by-uuid/afccf2a6-08ab-4260-a55a-ea44e8c25bb6";
      fsType = "btrfs";
      depends = ["/home"];
      options = [
        "nodev"
        "nosuid"
        "noexec"
        "subvolid=752"
      ];
    };
    "/home/rtkt/Misc" = {
      device = "/dev/disk/by-uuid/afccf2a6-08ab-4260-a55a-ea44e8c25bb6";
      fsType = "btrfs";
      depends = ["/home"];
      options = [
        "nodev"
        "nosuid"
        "noexec"
        "subvolid=757"
      ];
    };
    "/mnt/ps2smb" = {
      device = "/dev/disk/by-uuid/afccf2a6-08ab-4260-a55a-ea44e8c25bb6";
      fsType = "btrfs";
      depends = ["/home"];
      options = [
        "nodev"
        "nosuid"
        "noexec"
        "subvolid=1898"
      ];
    };
  };
  swapDevices = [{device = "/dev/disk/by-label/swap";}];
}
