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
      preview_libreoffice_path = "${pkgs.libreoffice-fresh}/bin/libreoffice";
      filesystem_check_changes = 1;
      cache_path = "${config.services.nextcloud.home}/cache";
      enabledPreviewProviders = [
        "OC\\Preview\\MP3"
        "OC\\Preview\\TXT"
        "OC\\Preview\\MarkDown"
        "OC\\Preview\\Krita"
        "OC\\Preview\\Imaginary"
        "OC\\Preview\\OpenDocument"
        "OC\\Preview\\Imaginary"
      ];
    };
    phpOptions = {
      "opcache.enable" = "1";
      "opcache.memory_consumption" = "256";
      "opcache.jit" = "1255";
      "opcache.jit_buffer_size" = "128M";
      "opcache.interned_strings_buffer" = "64";
      "opcache.save_comments" = "1";
      "opcache.revalidate_freq" = "600";
    };
    poolSettings = {
      pm = "dynamic";
      "pm.max_children" = "192";
      "pm.start_servers" = "4";
      "pm.min_spare_servers" = "4";
      "pm.max_spare_servers" = "32";
      "pm.max_requests" = "500";
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
