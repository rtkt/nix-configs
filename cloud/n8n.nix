{
  config,
  lib,
  pkgs,
  ...
}: let
  commonConfig = {
    enable = true;
    save = [
      [
        600
        1
      ]
    ];
    databases = 1;
    bind = "127.0.0.1";
    openFirewall = false;
  };
in {
  services.n8n-custom = {
    enable = true;
    user = "n8n";
    key = "${config.sops.secrets.n8n-encryption.path}";
    queue = {
      enable = true;
      redis.passwordFile = config.sops.secrets.n8n-queue.path;
    };
    smtp = {
      enable = true;
      host = "mail.cock.li";
      ssl = false;
      port = 587;
      sender = "n8nchan@waifu.club";
      user = "n8nchan@waifu.club";
      passwordFile = "${config.sops.secrets.n8n-smtp.path}";
    };
    settings = {
      N8N_PATH = "/";
      N8N_DEFAULT_LOCALE = "ru-RU";
      GENERIC_TIMEZONE = "${config.time.timeZone}";
      N8N_EDITOR_BASE_URL = "http://n8n.rtkt.cloud";
      N8N_USER_FOLDER = "/var/lib/n8n";
      NODE_FUNCTION_ALLOW_BUILTIN = "*";
      NODE_FUNCTION_ALLOW_EXTERNAL = "moment,lodash,any-date-parser";
      HOME = "/var/lib/n8n";
      N8N_LOG_LEVEL = "debug";
      EXECUTIONS_PROCESS = "main";
      EXECUTIONS_DATA_SAVE_ON_SUCCESS = "none";
      EXECUTION_DATA_PRUNE = "true";
      EXECUTION_DATA_PRUNE_TIMEOUT = "1800";
      EXECUTION_DATA_MAX_AGE = "168";
      EXECUTIONS_DATA_PRUNE_MAX_COUNT = "2000";
      EXECUTIONS_TIMEOUT = "1200";
      N8N_LISTEN_ADDRESS = "localhost";
      WEBHOOK_URL = "http://n8n.rtkt.cloud/";
      NODE_OPTIONS = "--max-old-space-size=2048 --use-largepages=on";
      DB_TYPE = "postgresdb";
      DB_POSTGRESDB_DATABASE = "n8n";
      DB_POSTGRESDB_USER = "n8n";
      DB_POSTGRESDB_PASSWORD_FILE = "${config.sops.secrets.n8n-db.path}";
    };
  };

  services.redis.servers = {
    vsdesk =
      commonConfig
      // {
        port = 65000;
        requirePassFile = config.sops.secrets.redis-vsdesk.path;
      };
    notion =
      commonConfig
      // {
        port = 65001;
        requirePassFile = config.sops.secrets.redis-notion.path;
      };
  };
}
