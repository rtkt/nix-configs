{
  lib,
  pkgs,
  ...
}: {
  services.postgresql = {
    enable = true;
    enableTCPIP = true;
    package = pkgs.postgresql_16;
    settings = {
      autovacuum = true;
    };
    ensureDatabases = [
      "n8n"
    ];
    ensureUsers = [
      {
        name = "root";
        ensureClauses = {
          superuser = true;
          login = true;
        };
      }
      {
        name = "n8n";
        ensureDBOwnership = true;
        ensureClauses.login = true;
      }
    ];
    authentication = lib.mkForce ''
      # TYPE  DATABASE        USER            ADDRESS                 METHOD
      # "local" is for Unix domain socket connections only
      local   all             all                                     trust
      # IPv4 local connections:
      host    all             all             127.0.0.1/32            md5
      # IPv6 local connections:
      host    all             all             ::1/128                 md5
      # Allow replication connections from localhost, by a user with the
      # replication privilege.
      local   replication     all                                     md5
      host    replication     all             127.0.0.1/32            md5
      host    replication     all             ::1/128                 md5
    '';
  };
  services.postgresqlBackup = {
    enable = true;
    backupAll = true;
    location = "/media/backups/postgresql";
    startAt = "*-*-* 03:00:00";
  };
}
