{
  config,
  lib,
  pkgs,
  sops-nix,
  ...
}: let
  nextcloudConfig = config.containers.nextcloud.config;
  hostDir = container: service: "/persist/containers/${container}/${service}";
  dirSettings = {
    "d" = {
      group = "root";
      mode = "0755";
      user = "root";
    };
  };
  genLogsDir = container: {
    "${genLogsDirName container}" = dirSettings;
  };
  genLogsDirName = container: "/var/log/containers/${container}";
in {
  containers.nextcloud = {
    autoStart = true;
    config = import ./nextcloud;
    bindMounts = {
      "${nextcloudConfig.services.nextcloud.home}" = {
        hostPath = hostDir "nextcloud" "nextcloud";
        isReadOnly = false;
      };
      "${nextcloudConfig.services.postgresql.dataDir}" = {
        hostPath = hostDir "nextcloud" "postgresql";
        isReadOnly = false;
      };
      "/var/log" = {
        hostPath = genLogsDirName "nextcloud";
        isReadOnly = false;
      };
      "${nextcloudConfig.services.nextcloud.datadir}/data" = {
        hostPath = "/media/raid/nextcloud";
        isReadOnly = false;
      };
    };
    ephemeral = true;
    extraFlags = [
      "--load-credential=nextcloudAdminPass:${config.sops.secrets.nextcloudAdminPass.path}"
      "--network-ipvlan=enp10s0"
    ];
    forwardPorts = [
      {
        containerPort = 80;
        hostPort = 9000;
        protocol = "tcp";
      }
    ];
    hostBridge = "br0";
    privateNetwork = true;
  };
  networking = {
    bridges."br0".interfaces = ["enp10s0"];
    interfaces = {
      br0.useDHCP = true;
      enp10s0.useDHCP = lib.mkForce false;
    };
    nat = {
      enable = true;
      internalInterfaces = ["ve-+" "vb-+" "iv-+"];
      internalIPs = ["10.0.1.0/24"];
      externalInterface = "enp10s0";
    };
    useDHCP = lib.mkForce false;
  };
  # systemd.network.netdevs.
  systemd.tmpfiles.settings."02-containers-logs" =
    {
      "/var/log/containers" = dirSettings;
    }
    // genLogsDir "nextcloud";
  users.users.nextcloud = {
    isSystemUser = true;
    group = "nextcloud";
    shell = "${pkgs.shadow}/bin/nologin";
    uid = nextcloudConfig.users.users.nextcloud.uid;
  };
  users.groups.nextcloud = {
    gid = nextcloudConfig.users.groups.nextcloud.gid;
  };
}
