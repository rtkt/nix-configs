{
  services.samba-for-ps2 = {
    enable = true;
    openFirewall = true;
    restrictAccess = true;
    allowedDevice = "FC:0F:E6:18:2A:56";
    port = "54";
    shares.PS2SMB = {
      "smb encrypt" = "disabled";
      path = "/mnt/ps2smb";
      browseable = true;
      "guest ok" = true;
      "read only" = false;
      public = true;
      available = true;
    };
  };
}
