{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  boot.isContainer = true;
  services.logrotate.enable = lib.mkForce false;
  system.stateVersion = "24.11";

  imports = [
    (modulesPath + "/profiles/minimal.nix")
    ./imaginary.nix
    ./mysql.nix
    ./nextcloud.nix
  ];
}
