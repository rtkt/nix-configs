{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  boot.isContainer = true;
  networking.firewall.allowedTCPPorts = [9000];
  services.logrotate.enable = lib.mkForce false;
  system.stateVersion = "24.11";

  imports = [
    (modulesPath + "/profiles/minimal.nix")
    ./imaginary.nix
    ./nextcloud.nix
    ./postgresql.nix
    ./users.nix
  ];
}
