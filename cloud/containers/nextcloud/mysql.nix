{
  config,
  lib,
  pkgs,
  ...
}: {
  services.mysql = {
    enable = true;
    package = pkgs.mariadb_110;
    ensureDatabases = [
      config.services.nextcloud.config.dbname
    ];
    ensureUsers = [
      {
        name = config.services.nextcloud.config.dbuser;
        ensurePermissions = {
          "config.services.nextcloud.config.dbname}.*" = "ALL PRIVILEGES";
        };
      }
    ];
  };
}
