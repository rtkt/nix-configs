{pkgs, ...}: {
  imports = [
    ./git.nix
    ./grub.nix
    ./htop.nix
    ./journal.nix
    ./nix.nix
    ./packages.nix
    ./security.nix
    ./shell.nix
    # ./sops.nix
    ./ssh.nix
    ./ssh-knownHosts.nix
    ./users-and-groups.nix
  ];

  time.timeZone = "Asia/Krasnoyarsk";
  networking.useDHCP = false;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.consoleLogLevel = 3;
}
