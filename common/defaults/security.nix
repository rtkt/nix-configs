{
  lib,
  pkgs,
  ...
}: {
  networking.firewall.enable = true;
  security.sudo.execWheelOnly = lib.mkDefault true;
  security.sudo.extraConfig = lib.mkDefault ''
    Defaults rootpw
  '';
  users = {
    mutableUsers = lib.mkDefault false;
    groups = {
      keys = {};
    };
  };
}
