{config, ...}: let
  passwordFile = secrets/passwords.yaml;
  redisFile = secrets/redis.yaml;
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
      # n8n-smtp = {
      #   sopsFile = secrets/n8n.yaml;
      #   owner = "${config.services.n8n-custom.user}";
      #   mode = "0400";
      #   key = "smtp-password";
      # };
    };
  };
}
