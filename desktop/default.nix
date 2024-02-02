{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ../common/hosts.nix
    ../common/documentation.nix

    ./ananicy.nix
    ./autossh.nix
    ./boot.nix
    # ./go-shadowsocks2-client.nix
    ./gpu.nix
    ./network.nix
    ./packages.nix
    ./partitions.nix
    ./printing.nix
    ./routedns.nix
    ./samba.nix
    ./security.nix
    ./smartd.nix
    ./sops.nix
    ./sound.nix
    ./syncthing.nix
    ./tmpfs.nix
    ./ui.nix
    ./users.nix
  ];

  security.rtkit.enable = true;
  services.irqbalance.enable = true;
}
