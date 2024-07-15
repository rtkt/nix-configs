{
  config,
  lib,
  pkgs,
  ...
}: {
  containers.nextcloud = {
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
