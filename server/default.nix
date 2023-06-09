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
    ./acme.nix
    ./compacting.nix
    # ./coredns.nix
    ./go-shadowsocks2.nix
    ./hardware-configuration.nix
    ./iptables.nix
    ./n8n.nix
    ./network.nix
    ./nginx.nix
    ./ntfy.nix
    ./packages.nix
    ./remote-builds.nix
    ./security.nix
    ./sops.nix
    ./ssh.nix
    ./sysctl.nix
    ./users.nix
  ];

  programs.zsh.shellAliases = {
    nixos-upgrade = "cd /etc/nixos && git pull && nixos-rebuild --build-host connector@localhost switch && nix store optimise";
  };
}
