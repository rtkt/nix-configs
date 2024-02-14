{config, ...}: let
  passwordFile = secrets/passwords.yaml;
  davfs2File = secrets/webdav.yaml;
in {
  sops = {
    secrets = {
      connector-password = {
        sopsFile = passwordFile;
        neededForUsers = true;
        key = "connector";
      };
      root-password = {
        sopsFile = passwordFile;
        neededForUsers = true;
        key = "root";
      };
      rtkt-password = {
        sopsFile = passwordFile;
        neededForUsers = true;
        key = "rtkt";
      };
      davfs2 = {
        sopsFile = davfs2File;
        key = "credentials";
        owner = "${config.services.davfs2.davUser}";
        mode = "0600";
      };
    };
  };
}
