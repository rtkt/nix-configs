{lib, ...}: {
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

  time.timeZone = lib.mkDefault "Asia/Krasnoyarsk";
  networking.useDHCP = lib.mkDefault false;
  boot.consoleLogLevel = lib.mkDefault 3;
}
