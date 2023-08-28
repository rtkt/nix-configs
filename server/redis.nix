{
  config,
  ...
}:
{
  services.redis.vmOverCommit = true;
  services.redis.servers.vsdesk = {
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
    port = 65000;
    databases = 1;
    bind = "127.0.0.1";
    openFirewall = false;
    requirePassFile = config.sops.secrets.redis-vsdesk.path;
  };
}
