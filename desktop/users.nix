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
      "libvirtd"
      "pipewire"
    ];
  };
  users.users.connector = {
    isSystemUser = true;
    group = "connector";
    createHome = true;
    shell = pkgs.zsh;
    home = "/var/lib/connector";
    hashedPasswordFile = config.sops.secrets.connector-password.path;
    extraGroups = [
      "wheel"
    ];
  };
  nix.settings.trusted-users = ["connector"];
  users.users.root.hashedPasswordFile = config.sops.secrets.root-password.path;
}
