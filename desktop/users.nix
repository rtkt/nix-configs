{
  config,
  pkgs,
  ...
}: {
  users.groups.pipewire = {};
  users.users.rtkt = {
    isNormalUser = true;
    hashedPasswordFile = config.sops.secrets.rtkt-password.path;
    extraGroups = [
      "wheel"
      "networkmanager"
      "pipewire"
    ];
  };
  users.users.root.hashedPasswordFile = config.sops.secrets.root-password.path;
}
