{config, lib, pkgs, ...}: {
  services.mysql = {
    enable = true;
    package = pkgs.mariadb_106;
  };
  services.mysqlBackup = {
    enable = true;
    location = "/media/backups/mysql";
    calendar = "Sat *-*-* 03:00:00";
    databases = [ ]
      ++ lib.optional (config.services.nextcloud.config.dbtype == "mysql") config.services.nextcloud.config.dbname;
  };
}
