{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./autossh.nix
    ./boot.nix
    ./documentation.nix
    ./go-shadowsocks2-client.nix
    ./gpu.nix
    ./libvirtd.nix
    ./network.nix
    ./packages.nix
    ./partitions.nix
    ./samba.nix
    ./security.nix
    ./smartd.nix
    ./sops.nix
    ./sound.nix
    ./syncthing.nix
    ./ui.nix
    ./users.nix
  ];
}
