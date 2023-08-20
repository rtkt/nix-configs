{
  config,
  lib,
  pkgs,
  ...
}: {
  services.n8n-custom = {
    enable = true;
    settings = {
      N8N_PATH = "/";
      N8N_PORT = lib.mkForce "9998";
      N8N_DEFAULT_LOCALE = "ru-RU";
      GENERIC_TIMEZONE = "Asia/Krasnoyarsk";
      N8N_EDITOR_BASE_URL = "https://n8n.shitnsticks.top";
      N8N_USER_FOLDER = "/var/lib/n8n";
      NODE_FUNCTION_ALLOW_BUILTIN = "*";
      NODE_FUNCTION_ALLOW_EXTERNAL = "moment,lodash";
      HOME = "/var/lib/n8n";
      EXECUTIONS_PROCESS = "main";
      EXECUTIONS_DATA_SAVE_ON_SUCCESS = "none";
      EXECUTION_DATA_PRUNE = "true";
      EXECUTION_DATA_PRUNE_TIMEOUT = "1800";
      EXECUTION_DATA_MAX_AGE = "168";
      EXECUTIONS_DATA_PRUNE_MAX_COUNT = "250";
      EXECUTIONS_TIMEOUT = "1200";
      N8N_LISTEN_ADDRESS = "localhost";
      WEBHOOK_URL = "https://n8n.shitnsticks.top/";
    };
  };
}
