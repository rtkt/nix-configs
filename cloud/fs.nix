{lib, ...}: let
  genMount = device: target: options: {
    "${target}" =
      {
        inherit device;
        fsType = "zfs";
      }
      // options;
  };
  genMediaMount = path: genMount path "/media/${path}" {};
  genLinkSettings = path: {
    "${path}" = {
      "L+" = {
        argument = "/persist${path}";
      };
    };
  };
  rootOpts = {
    options = lib.mkForce ["rw" "noatime" "noexec" "nosuid" "nodev" "noauto"];
    neededForBoot = true;
  };
  storeOpts = {
    options = lib.mkForce ["ro" "noatime" "noauto" "casesensitive"];
    neededForBoot = true;
  };
  root = "root";
in {
  boot = {
    extraModprobeConfig = ''
      options zfs zfs_nopwrite_enabled=1
    '';
    initrd.postDeviceCommands = lib.mkAfter ''
      zfs rollback -r root@clean
      zfs rollback -r root/etc@clean
    '';
    zfs.devNodes = "/dev/disk/by-id";
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
    // genMount root "/" rootOpts
    // genMount "${root}/etc" "/etc" rootOpts
    // genMount "${root}/nix" "/nix" storeOpts
    // genMount "${root}/persist" "/persist" rootOpts
    // genMount "${root}/persist/rtkt" "/home/rtkt" rootOpts
    // genMount "${root}/persist/root" "/root" rootOpts
    // genMount "${root}/persist/logs" "/var/log" rootOpts;
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
