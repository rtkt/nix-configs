{
  config,
  pkgs,
  ...
}: {
  services.postgresql = {
    enable = true;
    enableJIT = true;
    ensureDatabases = [config.services.nextcloud.config.dbname];
    ensureUsers = [{name = config.services.nextcloud.config.dbuser;}];
    package = pkgs.postgresql_16_jit;
    settings = {
      full_page_writes = false;
    };
  };
}
