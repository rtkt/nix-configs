{
  config,
  pkgs,
  ...
}: {
  users.users.rtkt = {
    isNormalUser = true;
    home = "/home/rtkt";
    extraGroups = ["wheel"];
    hashedPasswordFile = config.sops.secrets.rtkt-password.path;
  };
  users.users.root.hashedPasswordFile = config.sops.secrets.root-password.path;
}
