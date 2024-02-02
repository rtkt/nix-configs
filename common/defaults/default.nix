{
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./git.nix
    ./grub.nix
    ./htop.nix
    ./journal.nix
    ./kernel.nix
    ./nix.nix
    ./packages.nix
    ./security.nix
    ./shell.nix
    ./smartd.nix
    ./sops.nix
    ./ssh.nix
    ./ssh-knownHosts.nix
    ./users-and-groups.nix
  ];

  time.timeZone = "Asia/Krasnoyarsk";
  networking.useDHCP = false;
  boot.consoleLogLevel = 3;
}
