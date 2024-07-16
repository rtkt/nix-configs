{
  config,
  pkgs,
  ...
}: let
  nextcloudUsers = config.containers.nextcloud.config.users;
  genUser = container: user: {
    "${container}-${user}" = {
      isSystemUser = true;
      group = "${container}-${user}";
      shell = "${pkgs.shadow}/bin/nologin";
      uid = config.containers."${container}".config.users.users."${user}".uid;
    };
  };
  genGroup = container: group: {
    "${container}-${group}" = {
      gid = config.containers."${container}".config.groups.gid;
    };
  };
in {
  users.users = {
    rtkt = {
      isNormalUser = true;
      home = "/home/rtkt";
      hashedPasswordFile = config.sops.secrets.rtkt-password.path;
    };
    root.hashedPasswordFile = config.sops.secrets.root-password.path;
    # nextcloud-nextcloud = {
    #   isSystemUser = true;
    #   group = "nextcloud-nextcloud";
    #   shell = "${pkgs.shadow}/bin/nologin";
    #   uid = nextcloudUsers.users.nextcloud.uid;
    # };
  };
  users.groups = {
    nextcloud = {};
  };
}
