{
  config,
  lib,
  pkgs,
  ...
}: {
  services.nextcloud = {
    enable = true;
    hostName = "files.rtkt.cloud";
    database.createLocally = true;
    package = pkgs.nextcloud29;
    config = {
      dbtype = "mysql";
      adminpassFile = "/run/secrets/nextcloudAdminPass";
    };
  };
}
