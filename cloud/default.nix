# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ../common/am3.nix
    ../common/hosts.nix
    ../common/documentation.nix
    ../common/nozswap.nix

    # ./acme.nix
    # ./go-shadowsocks2.nix
    ./boot.nix
    ./imaginary.nix
    ./mysql.nix
    ./n8n.nix
    ./network.nix
    ./nextcloud.nix
    ./nginx.nix
    # ./nginx-dns.nix
    ./ntfy.nix
    ./packages.nix
    ./partitions.nix
    # ./remote-builds.nix
    ./samba.nix
    ./security.nix
    ./sops.nix
    ./ssh.nix
    ./sysctl.nix
    ./tmpfs.nix
    # ./unbound.nix
    ./users.nix
  ];

  systemd.extraConfig = ''
    DefaultLimitNOFILE=16384:524288
  '';
}
