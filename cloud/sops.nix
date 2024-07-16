{
  config,
  lib,
  ...
}: let
  passwordFile = secrets/passwords.yaml;
  redisFile = secrets/redis.yaml;
  nextcloudFile = secrets/nextcloud.yaml;
  n8nFile = secrets/n8n.yaml;
  nextcloudMysqlFile = secrets/nextcloud-mysql.yaml;
  mysqlFile = secrets/mysql.yaml;
in {
  sops = {
    age.sshKeyPaths = lib.mkForce [
      "/persist/etc/ssh/ssh_host_ed25519_key"
      "/root/.ssh/sops-nix"
    ];
    secrets = {
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
      nextcloudAdminPass = {
        sopsFile = nextcloudFile;
        owner = "root";
        group = "root";
        key = "nextcloudAdminPass";
        mode = "0400";
      };
      # redis-vsdesk = {
      #   sopsFile = redisFile;
      #   owner = "redis-vsdesk";
      #   mode = "0440";
      #   group = "redis-vsdesk";
      #   key = "vsdesk";
      # };
      # redis-notion = {
      #   sopsFile = redisFile;
      #   owner = "redis-notion";
      #   mode = "0440";
      #   group = "redis-notion";
      #   key = "notion";
      # };
      # n8n-smtp = {
      #   sopsFile = n8nFile;
      #   owner = "${config.services.n8n-custom.user}";
      #   mode = "0400";
      #   key = "smtp-password";
      # };
      # n8n-encryption = {
      #   sopsFile = n8nFile;
      #   owner = "${config.services.n8n-custom.user}";
      #   mode = "0400";
      #   key = "encryption";
      # };
      # n8n-db = {
      #   sopsFile = n8nFile;
      #   owner = "${config.services.n8n-custom.user}";
      #   mode = "0400";
      #   key = "db";
      # };
      # n8n-queue = {
      #   sopsFile = redisFile;
      #   owner = "${config.services.n8n-custom.user}";
      #   mode = "0400";
      #   key = "n8n";
      # };
    };
  };
}
