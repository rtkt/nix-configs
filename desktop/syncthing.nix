{
  services.syncthing = {
    enable = true;
    user = "rtkt";
    group = "users";
    dataDir = "/home/rtkt";
    systemService = true;
    openDefaultPorts = true;
    overrideDevices = true;
    overrideFolders = true;
    settings = {
      devices.phone.id = "24BNLMG-5HUXTAA-GDPKX7U-5MBFWJD-W3SHTH7-IXOBZSK-TPD667F-YT4AXAB";
      folders = {
        "Android Камера" = {
          id = "moto_g85_5g_fzh8 фото";
          path = "/home/rtkt/Изображения/Телефон/";
          type = "sendreceive";
          devices = ["phone"];
        };
        "Keepass" = {
          id = "Keepass";
          path = "/home/rtkt/Документы/Keepass";
          type = "sendreceive";
          devices = ["phone"];
          versioning = {
            type = "staggered";
            params = {
              cleanInterval = "3600";
              maxAge = "15768000";
            };
          };
        };
      };
    };
  };
  systemd.services.syncthing.environment.STNODEFAULTFOLDER = "true";
}
