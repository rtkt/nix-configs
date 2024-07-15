{
  config,
  lib,
  pkgs,
  ...
}: {
  containers.nextcloud = {
    autoStart = true;
    config = import ./nextcloud;
    bindMounts = {
      "/run/secrets/nextcloudAdminPass" = {
        hostPath = config.sops.secrets.nextcloudAdminPass.path;
        isReadOnly = true;
      };
    };
    ephemeral = true;
    nixpkgs = pkgs.path;
  };
}
