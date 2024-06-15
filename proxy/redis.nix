{config, ...}: let
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
  services.redis.vmOverCommit = true;
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
    vsdeskv2 =
      commonConfig
      // {
        port = 65002;
        user = "redis-vsdesk";
        requirePassFile = config.sops.secrets.redis-vsdesk.path;
      };
  };
}
