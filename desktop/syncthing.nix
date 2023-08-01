{
  services.syncthing = {
    enable = true;
    user = "rtkt";
    dataDir = "/home/rtkt/Misc/Syncthing";
    configDir = "/home/rtkt/.config/syncthing";
    overrideDevices = true;
    overrideFolders = true;
    settings = {
      devices = {
        "work" = {id = "6ZWYE5C-P3C5EBE-BAGAVOP-22IUEC4-JA7NMG3-L6MAUPH-64C4CV7-CWXQDAD";};
      };
      folders = {
        "Keepass" = {
          path = "/home/rtkt/Документы/Keepass";
          type = "sendreceive";
          devices = ["work"];
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
}
