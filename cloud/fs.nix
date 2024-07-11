{lib, ...}: let
  genMount = device: target: options: {
    "${target}" =
      {
        inherit device;
        fsType = "zfs";
      }
      // options;
  };
  genRootMount = device: path:
    genMount device path {neededForBoot = true;};
  genMediaMount = path: genMount path "/media/${path}" {};
  genLinkSettings = path: {
    "${path}" = {
      "L+" = {
        argument = "/persist${path}";
      };
    };
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
    // genRootMount root "/"
    // genRootMount "${root}/etc" "/etc"
    // genRootMount "${root}/nix" "/nix"
    // genRootMount "${root}/persist" "/persist"
    // genRootMount "${root}/persist/rtkt" "/home/rtkt"
    // genRootMount "${root}/persist/root" "/root"
    // genRootMount "${root}/persist/logs" "/var/log";
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
