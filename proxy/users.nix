{config, ...}: {
  users.users.rtkt = {
    isNormalUser = true;
    home = "/home/rtkt";
    extraGroups = ["wheel"];
    hashedPasswordFile = config.sops.secrets.rtkt-password.path;
  };
  users.users.connector = {
    isNormalUser = true;
    group = "connector";
    hashedPasswordFile = config.sops.secrets.connector-password.path;
  };
  users.users.root.hashedPasswordFile = config.sops.secrets.root-password.path;
}
