{config, ...}: {
  users.users.rtkt = {
    isNormalUser = true;
    home = "/home/rtkt";
    extraGroups = ["wheel"];
    passwordFile = config.sops.secrets.rtkt-password.path;
  };
  users.users.connector = {
    isNormalUser = true;
    group = "connector";
    passwordFile = config.sops.secrets.connector-password.path;
  };
  users.users.root.passwordFile = config.sops.secrets.root-password.path;
}
