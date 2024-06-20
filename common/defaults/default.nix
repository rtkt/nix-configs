{
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./environment.nix
    ./git.nix
    ./htop.nix
    ./kernel.nix
    ./nix.nix
    ./security.nix
    ./sops.nix
    ./ssh.nix
  ];

  time.timeZone = "Asia/Krasnoyarsk";
  networking.useDHCP = false;
  boot.consoleLogLevel = 3;
}
