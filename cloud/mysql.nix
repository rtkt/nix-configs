{config, lib, pkgs, ...}: {
  services.mysql = {
    enable = true;
    package = pkgs.mariadb_106;
    settings = {
      mysqld = {
        transaction_isolation = "READ-COMMITTED";
        binlog_format = "ROW";
        skip_networking = true;

        innodb_buffer_pool_size = "1G";
        innodb_io_capacity = "4000";
      };
    };
  };
  services.mysqlBackup = {
    enable = true;
    location = "/media/backups/mysql";
    calendar = "Sat *-*-* 03:00:00";
    databases = [ ]
      ++ lib.optional (config.services.nextcloud.config.dbtype == "mysql") config.services.nextcloud.config.dbname;
  };
  systemd.services.mysql.serviceConfig = {
    LimitMEMLOCK = "8M";
    LimitNOFILE = "unlimited";
  };
}
