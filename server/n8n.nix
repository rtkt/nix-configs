{
  config,
  lib,
  pkgs,
  ...
}: {
  services.n8n-custom = {
    enable = true;
    quota = 92;
    memorymax = "750M";
    user = "n8n";
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
      N8N_EDITOR_BASE_URL = "https://n8n.shitnsticks.top";
      N8N_USER_FOLDER = "/var/lib/n8n";
      NODE_FUNCTION_ALLOW_BUILTIN = "*";
      NODE_FUNCTION_ALLOW_EXTERNAL = "moment,lodash,any-date-parser";
      NODE_PATH = "${pkgs.n8n}/lib,${pkgs.any-date-parser}/lib";
      HOME = "/var/lib/n8n";
      N8N_LOG_LEVEL = "warn";
      EXECUTIONS_PROCESS = "main";
      EXECUTIONS_DATA_SAVE_ON_SUCCESS = "none";
      EXECUTION_DATA_PRUNE = "true";
      EXECUTION_DATA_PRUNE_TIMEOUT = "1800";
      EXECUTION_DATA_MAX_AGE = "168";
      EXECUTIONS_DATA_PRUNE_MAX_COUNT = "100";
      EXECUTIONS_TIMEOUT = "1200";
      N8N_LISTEN_ADDRESS = "localhost";
      WEBHOOK_URL = "https://n8n.shitnsticks.top/";
      NODE_OPTIONS = "--max-old-space-size=2048 --use-largepages=on";
    };
  };
}
