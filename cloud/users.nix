{
  config,
  pkgs,
  ...
}: {
  users.users = {
    rtkt = {
      isNormalUser = true;
      home = "/home/rtkt";
      hashedPasswordFile = config.sops.secrets.rtkt-password.path;
    };
    root.hashedPasswordFile = config.sops.secrets.root-password.path;
    nextcloud = {
      isSystemUser = true;
      group = "nextcloud";
      shell = "${pkgs.shadow}/bin/nologin";
    };
  };
  users.groups = {
    nextcloud = {};
  };
}
