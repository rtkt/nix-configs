{
  lib,
  pkgs,
  ...
}: let
  genMount = device: target: options: {
    "${target}" =
      {
        inherit device;
        fsType = "zfs";
      }
      // options;
  };
  genMediaMount = path: options: genMount path "/media/${path}" options;
  genLinkSettings = path: {
    "${path}" = {
      "L+" = {
        argument = "/persist${path}";
      };
    };
  };
  genProps = props: builtins.concatStringsSep " " (lib.mapAttrsToList (name: value: "${name}=${value}") props);
  genZFSSetCommand = props: datastore: builtins.concatStringsSep " " ["${pkgs.zfs}/bin/zfs set" (genProps props) datastore];
  rootOpts = {
    options = lib.mkForce ["rw" "noatime" "noexec" "nosuid" "nodev"];
    neededForBoot = true;
  };
  persistOpts = {
    options = lib.mkForce ["rw" "noatime" "exec" "nosuid" "nodev"];
    neededForBoot = true;
  };
  storeOpts = {
    options = lib.mkForce ["rw" "noatime" "exec" "suid"];
    neededForBoot = true;
  };
  mediaOpts = {
    options = lib.mkForce ["rw" "relatime" "noexec" "nosuid" "nodev"];
  };
  defaultProps = {
    canmount = "noauto";
    checksum = "blake3";
    dedup = "off";
    xattr = "sa";
    mountpoint = "legacy";
  };
  rootProps =
    {
      compression = "zstd";
      logbias = "latency";
    }
    // defaultProps;
  nixProps =
    {
      recordsize = "8M";
    }
    // defaultProps
    // rootProps;
  logProps =
    {
      acltype = "posix";
      compression = "zstd-9";
      logbias = "latency";
      recordsize = "128K";
    }
    // defaultProps;
  mediaProps =
    {
      acltype = "off";
      recordsize = "8M";
      logbias = "throughput";
    }
    // defaultProps;
  torrentProps =
    {
      recordsize = "16K";
    }
    // defaultProps;
  root = "root";
in {
  boot = {
    extraModprobeConfig = ''
      options zfs zfs_nopwrite_enabled=1
    '';
    initrd.postDeviceCommands = lib.mkAfter ''
      zfs rollback -r root@clean

      ${genZFSSetCommand rootProps root}
      ${genZFSSetCommand nixProps "${root}/nix"}
      ${genZFSSetCommand rootProps "${root}/persist"}
      ${genZFSSetCommand rootProps "${root}/persist/rtkt"}
      ${genZFSSetCommand rootProps "${root}/persist/root"}
      ${genZFSSetCommand logProps "${root}/persist/logs"}
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
    // genMediaMount "raid" mediaOpts
    // genMediaMount "filestorage" mediaOpts
    // genMediaMount "filestorage/files" mediaOpts
    // genMediaMount "filestorage/torrents" mediaOpts
    // genMediaMount "filestorage/ps2smb" mediaOpts
    // genMount root "/" rootOpts
    // genMount "${root}/nix" "/nix" storeOpts
    // genMount "${root}/persist" "/persist" persistOpts
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
  systemd = {
    services."zfs-set-props-on-non-root-vdevs" = {
      description = "A oneshot service to set ZFS datastore props on non-root vdevs";
      after = ["zfs-import.target"];
      wantedBy = ["zfs.target"];
      script = ''
        ${genZFSSetCommand mediaProps "filestorage/files"}
        ${genZFSSetCommand mediaProps "filestorage/ps2smb"}
        ${genZFSSetCommand defaultProps "raid"}
      '';
      serviceConfig = {
        Type = "exec";
      };
    };
    services.zpool-trim.serviceConfig.ExecStart = lib.mkForce "zpool trim -w ${root}";
    timers.zpool-trim = {
      timerConfig = {
        OnCalendar = lib.mkForce "Sun 02:00:00";
        RandomizedDelaySec = lib.mkForce "2h";
      };
    };
  };
}
