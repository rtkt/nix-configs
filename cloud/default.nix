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
    ../common/uefi.nix
    ../common/hosts.nix
    ../common/documentation.nix
    ../common/nozswap.nix
    ../common/smartd.nix

    # ./containers.nix

    # ./acme.nix
    # ./go-shadowsocks2.nix
    ./hardware.nix
    # ./imaginary.nix
    ./libvirtd.nix
    ./mysql.nix
    ./n8n.nix
    ./network.nix
    # ./nextcloud.nix
    ./nginx.nix
    # ./nginx-dns.nix
    ./ntfy.nix
    ./packages.nix
    ./partitions.nix
    ./postgresql.nix
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

  services.logrotate.checkConfig = false;
}
