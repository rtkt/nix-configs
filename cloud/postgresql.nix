{ pkgs, ... }:
{
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
      }
    ];
  };
}
