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
      path = "/media/hdd/ps2smb";
      browseable = true;
      "guest ok" = true;
      "read only" = false;
      public = true;
      available = true;
    };
  };
  # services.samba = {
  #   enable = true;
  #   openFirewall = true;
  #   securityType = "user";
  #   extraConfig = ''
  #     valid users = +users
  #     server min protocol = SMB3_02
  #     server smb encrypt = required
  #   '';
  #   shares.hdd = {
  #     path = "/media/hdd";
  #     "read only" = false;
  #     available = true;
  #     browseable = true;
  #     "guest ok" = false;
  #     "create mask" = "0644";
  #     "directory mask" = "0755";
  #   };
  # };
  # systemd.services.set-samba-password = lib.mkIf config.services.samba.enable {
  #   enable = true;
  #   wantedBy = ["samba.target"];
  #   before = ["samba.service"];
  #   script = ''
  #     PASS="$(cat ${config.sops.secrets.rtkt-unencrypted.path})"
  #     ${pkgs.samba}/bin/smbpasswd -x rtkt || true
  #     echo -ne "$PASS\n$PASS\n" | ${pkgs.samba}/bin/smbpasswd -sa rtkt
  #   '';
  #   serviceConfig = {
  #     Type = "oneshot";
  #   };
  # };
}
