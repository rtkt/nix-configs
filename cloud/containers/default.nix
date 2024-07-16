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
    ];
    forwardPorts = [
      {
        containerPort = 80;
        hostPort = 9000;
        protocol = "tcp";
      }
    ];
    privateNetwork = true;
  };
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
