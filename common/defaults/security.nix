{pkgs, ...}: {
  networking.firewall.enable = true;
  security.sudo.execWheelOnly = true;
  security.sudo.extraConfig = ''
    Defaults rootpw
  '';
  users = {
    mutableUsers = false;
    groups = {
      keys = {};
    };
  };
}
