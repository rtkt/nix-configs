{config, ...}: let
  passwordFile = secrets/passwords.yaml;
  redisFile = secrets/redis.yaml;
  nextcloudFile = secrets/nextcloud.yaml;
  n8nFile = secrets/n8n.yaml;
  mysqlFile = secrets/mysql.yaml;
in {
  sops = {
    secrets = {
      connector-password = {
        sopsFile = passwordFile;
        neededForUsers = true;
        key = "connector";
      };
      root-password = {
        sopsFile = passwordFile;
        neededForUsers = true;
        key = "root";
      };
      rtkt-password = {
        sopsFile = passwordFile;
        neededForUsers = true;
        key = "rtkt";
      };
      redis-vsdesk = {
        sopsFile = redisFile;
        owner = "redis-vsdesk";
        mode = "0440";
        group = "redis-vsdesk";
        key = "vsdesk";
      };
      redis-notion = {
        sopsFile = redisFile;
        owner = "redis-notion";
        mode = "0440";
        group = "redis-notion";
        key = "notion";
      };
      n8n-smtp = {
        sopsFile = n8nFile;
        owner = "${config.services.n8n-custom.user}";
        mode = "0400";
        key = "smtp-password";
      };
      nextcloud-admin-password = {
        sopsFile = nextcloudFile;
        owner = "nextcloud";
        mode = "0400";
        key = "admin";
      };
      nextcloud-mysql-user = {
        sopsFile = nextcloudFile;
        owner = "nextcloud";
        group = "mysql";
        mode = "0440";
        key = "mysql-user";
      };
      mysql-root = {
        sopsFile = mysqlFile;
        owner = "mysql";
        mode = "0400";
        key = "root";
      };
    };
  };
}
