{config, ...}: let
  passwordFile = secrets/passwords.yaml;
  redisFile = secrets/redis.yaml;
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
    };
  };
}
