{
  config,
  lib,
  pkgs,
  ...
}: {
  services.nextcloud = {
    enable = true;
    hostName = "files.rtkt.cloud";
    package = pkgs.nextcloud28;
    home = "/var/lib/nextcloud";
    database.createLocally = true;
    caching.redis = true;
    configureRedis = true;
    # notify_push.enable = true;
    config = {
      dbtype = "mysql";
      adminpassFile = config.sops.secrets.nextcloud-admin-password.path;
    };
    settings = {
      default_phone_region = "RU";
      default_language = "ru";
      default_locale = "ru";
      default_timezone = config.time.timeZone;
      trashbin_retention_obligation = "auto, 60";
      updatechecker = false;
      logtimezone = config.time.timeZone;
      preview_imaginary_url = "http://${config.services.imaginary.address}:${builtins.toString config.services.imaginary.port}/";
      preview_ffmpeg_path = "${pkgs.ffmpeg}/bin/ffmpeg";
      filesystem_check_changes = 1;
    };
  };

  services.mysql = {
    enable = lib.mkDefault true;
    ensureDatabases = [
      "${config.services.nextcloud.config.dbname}"
    ];
    ensureUsers = [
      {
        name = "${config.services.nextcloud.config.dbuser}";
        ensurePermissions = {
          "${config.services.nextcloud.config.dbname}.*" = "ALL PRIVILEGES";
        };
      }
    ];
  };
}
