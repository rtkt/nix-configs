{
  config,
  lib,
  pkgs,
  ...
}: {
  services.nextcloud = {
    enable = true;
    hostName = "files.rtkt.cloud";
    database.createLocally = true;
    package = pkgs.nextcloud29;
    config = {
      dbtype = "pgsql";
      adminpassFile = "/run/secrets/nextcloudAdminPass";
    };
  };
  systemd.services.phpfpm-nextcloud.after = ["systemd-tmpfiles-setup.service"];
  systemd.tmpfiles.settings."01-nextcloud-credentials" = {
    "/run/secrets" = {
      "d" = {
        group = config.users.groups.nextcloud.name;
        mode = "0700";
        user = config.users.users.nextcloud.name;
      };
    };
    "/run/secrets/nextcloudAdminPass" = {
      "C" = {
        argument = "/run/host/credentials/nextcloudAdminPass";
        group = config.users.groups.nextcloud.name;
        mode = "0400";
        user = config.users.users.nextcloud.name;
      };
    };
  };
}
