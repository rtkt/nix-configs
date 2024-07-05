{
  config,
  lib,
  pkgs,
  ...
}: {
  services.samba-for-ps2 = {
    enable = true;
    openFirewall = true;
    restrictAccess = true;
    allowedDevices = ["FC:0F:E6:18:2A:56" "94:de:80:3d:cd:58"];
    port = "54";
    globalConfig = ''
      workgroup = WORKGROUP
      map to guest = Bad Password
      guest account = nobody
      socket options = TCP_NODELAY TCP_KEEPIDLE=20 IPTOS_LOWDELAY SO_KEEPALIVE
      lanman auth = no
      server min protocol = NT1
      server signing = disabled
      lm announce = no
      smb ports = ${config.services.samba-for-ps2.port}
    '';
    shares.PS2SMB = {
      "smb encrypt" = "disabled";
      path = "/media/filestorage/ps2smb";
      browseable = true;
      "guest ok" = true;
      "read only" = false;
      public = true;
      available = true;
    };
  };
  security.apparmor.policies.samba-for-ps2 = {
    enable = true;
    enforce = false;
    profile = ''
      #include <tunables/global>
      ${pkgs.samba-for-ps2}/sbin/smbd {
      	"${config.services.samba-for-ps2.shares.PS2SMB.path}/" rk,
      	"${config.services.samba-for-ps2.shares.PS2SMB.path}/**" lrwk,
      }
    '';
  };
}
