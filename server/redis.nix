{
  config,
  ...
}:
let commonConfig = {
  enable = true;
  save = [
    [
      60
      1
    ]
    [
      3600
      100000
    ]
  ];
  databases = 1;
  bind = "127.0.0.1";
  openFirewall = false;
}; in
{
  services.redis.vmOverCommit = true;
  services.redis.servers = {
    vsdesk = commonConfig // {
      port = 65000;
      requirePassFile = config.sops.secrets.redis-vsdesk.path;
    };
    notion = commonConfig // {
      port = 65001;
      requirePassFile = config.sops.secrets.redis-notion.path;
    };
  };
}
