{
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./git.nix
    ./htop.nix
    ./journal.nix
    ./kernel.nix
    ./nix.nix
    ./packages.nix
    ./security.nix
    ./shell.nix
    ./sops.nix
    ./ssh.nix
    ./users-and-groups.nix
  ];

  time.timeZone = "Asia/Krasnoyarsk";
  networking.useDHCP = false;
  boot.consoleLogLevel = 3;
}
