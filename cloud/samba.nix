{config, ...}:
{
  services.samba-for-ps2 = {
    enable = true;
    openFirewall = true;
    restrictAccess = true;
    allowedDevice = "FC:0F:E6:18:2A:56";
    port = "54";
    globalConfig = ''
      workgroup = WORKGROUP
      map to guest = Bad Password
      guest account = nextcloud
      socket options = TCP_NODELAY TCP_KEEPIDLE=20 IPTOS_LOWDELAY SO_KEEPALIVE
      lanman auth = no
      server min protocol = NT1
      server signing = disabled
      lm announce = no
      smb ports = ${config.services.samba-for-ps2.port}
    '';
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
  services.samba = {
    enable = true;
    openFirewall = true;
    
  };
}
