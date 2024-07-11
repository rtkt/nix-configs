let
  genRootMount = pool: path: {
    "/${path}" = {
      device =
        if path == ""
        then pool
        else "${pool}/${path}";
      fsType = "zfs";
    };
  };
  genMediaMount = path: {
    "/media/${path}" = {
      device = path;
      fsType = "zfs";
    };
  };
  genLinkSettings = path: {
    "${path}" = {
      "L+" = {
        argument = "/persist${path}";
      };
    };
  };
  root = "root";
in {
  boot.extraModprobeConfig = ''
    options zfs zfs_nopwrite_enabled=1
  '';
  boot.zfs = {
    devNodes = "/dev/disk/by-id";
    extraPools = [
      "raid"
      "filestorage"
    ];
  };
  fileSystems =
    {
      "/boot" = {
        device = "/dev/disk/by-id/ata-Samsung_SSD_870_EVO_1TB_S74ZNX0W302758N-part2";
        fsType = "vfat";
        options = ["umask=177" "dmask=077" "uid=0" "gid=0"];
      };
    }
    // genMediaMount "raid"
    // genMediaMount "filestorage"
    // genMediaMount "filestorage/files"
    // genMediaMount "filestorage/files/Games"
    // genMediaMount "filestorage/files/Videos"
    // genMediaMount "filestorage/torrents"
    // genMediaMount "filestorage/ps2smb"
    // genRootMount root ""
    // genRootMount root "etc"
    // genRootMount root "nix"
    // genRootMount root "persist";
  swapDevices = [{device = "/dev/disk/by-id/ata-Samsung_SSD_870_EVO_1TB_S74ZNX0W302758N-part1";}];
  systemd.tmpfiles.settings."01-linking-from-persist" =
    {}
    // genLinkSettings "/etc/ssh/ssh_host_rsa_key"
    // genLinkSettings "/etc/ssh/ssh_host_rsa_key.pub"
    // genLinkSettings "/etc/ssh/ssh_host_ed25519_key"
    // genLinkSettings "/etc/ssh/ssh_host_ed25519_key.pub"
    // genLinkSettings "/etc/nixos";
  # services.fstrim = {
  #   enable = true;
  #   interval = "05:00";
  # };
}
