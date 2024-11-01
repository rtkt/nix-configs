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

    ./containers

    ./boot.nix
    ./fs.nix
    ./logging.nix
    ./minimization.nix
    ./network.nix
    # ./nginx.nix
    ./packages.nix
    ./samba-for-ps2.nix
    ./security.nix
    ./sops.nix
    ./tmpfs.nix
    ./users.nix
  ];
}
