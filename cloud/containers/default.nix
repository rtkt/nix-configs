{
  config,
  lib,
  pkgs,
  ...
}: let
  cloudConfig = config.containers.nextcloud.config;
in {
  containers.nextcloud = {
    autoStart = true;
    config = import ./nextcloud;
    bindMounts = {
      "/run/secrets/nextcloudAdminPass" = {
        hostPath = config.sops.secrets.nextcloudAdminPass.path;
        isReadOnly = true;
      };
      "${cloudConfig.services.nextcloud.home}" = {
        hostPath = "/persist/containers/nextcloud/nextcloud";
        isReadOnly = false;
      };
      "${cloudConfig.services.mysql.dataDir}" = {
        hostPath = "/persist/containers/nextcloud/mysql";
        isReadOnly = false;
      };
    };
    ephemeral = true;
    nixpkgs = pkgs.path;
  };
}
