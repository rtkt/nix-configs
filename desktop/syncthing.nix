{
  services.syncthing = {
    enable = true;
    user = "rtkt";
    dataDir = "/home/rtkt/Misc/Syncthing";
    configDir = "/home/rtkt/.config/syncthing";
    overrideDevices = true;
    overrideFolders = true;
    devices = {
      # "phone" = {id = "SBPXGPN-C7Y3BBL-HWHDM35-QLGN2CD-RVT3LDJ-JNM3ADL-4LYMK3U-KABVJAM";};
      "work" = {id = "KFLC3OO-HR5SOOC-Q7EAL65-CWX4LR4-RKT4GQF-SMUK2RZ-YRTKM3C-YLYPAA5";};
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
      # "TitaniumBackup" = {
      #   path = "/home/rtkt/Misc/Android/TitaniumBackup";
      #   type = "sendreceive";
      #   devices = ["phone"];
      #   versioning = {
      #     type = "staggered";
      #     params = {
      #       cleanInterval = "3600";
      #       maxAge = "78840000";
      #     };
      #   };
      # };
    };
  };
}
