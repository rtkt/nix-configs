{config, pkgs,...}:
{
  services.nextcloud = {
    enable = true;
    hostName = "files.rtkt.cloud";
    package = pkgs.nextcloud28;
    home = "/var/lib/nextcloud";
    database.createLocally = true;
    config = {
      dbtype = "mysql";
      adminpassFile = config.sops.secrets.mariadb-admin-password.path;
    };
  };

  services.mysql = {
    ensureDatabases = [
      "${config.services.nextcloud.config.dbname}"
    ];
    ensureUsers = [
      {
        name = "${config.services.nextcloud.config.dbuser}";
        ensurePermissions = {
          "${config.services.nextcloud.config.dbname}.*" = "ALL PRIVILEGES";
        };
      }
    ];
  };
}
