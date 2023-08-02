{
  config,
  pkgs,
  ...
}: {
  users.users.rtkt = {
    isNormalUser = true;
    passwordFile = config.sops.secrets.rtkt-password.path;
    extraGroups = [
      "wheel"
      "networkmanager"
      "libvirtd"
    ];
  };
  users.users.connector = {
    isSystemUser = true;
    group = "connector";
    createHome = true;
    shell = pkgs.zsh;
    home = "/var/lib/connector";
    passwordFile = config.sops.secrets.connector-password.path;
    extraGroups = [
      "wheel"
    ];
  };
  nix.settings.trusted-users = ["connector"];
  users.users.root.passwordFile = config.sops.secrets.root-password.path;
}
