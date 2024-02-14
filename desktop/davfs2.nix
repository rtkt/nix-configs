{ config, ... }:
{
  services.davfs2 = {
    enable = true;
  };
  users.users.rtkt.extraGroups = [
    config.services.davfs2.davGroup
  ];
}
