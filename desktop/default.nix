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
    ../common/smartd.nix
    ../common/multimedia.nix
    ../common/nozswap.nix
    ../common/zfs.nix

    ./boot.nix
    # ./go-shadowsocks2-client.nix
    ./gpu.nix
    ./network.nix
    ./packages.nix
    ./partitions.nix
    ./printing.nix
    # ./routedns.nix
    # ./samba.nix
    ./security.nix
    ./sops.nix
    ./sound.nix
    ./syncthing.nix
    ./tmpfs.nix
    ./ui.nix
    ./users.nix
  ];
  hardware.mcelog.enable = true;
  virtualisation.libvirtd = {
    enable = true;
    onBoot = "start";
    onShutdown = "suspend";
    qemu.runAsRoot = false;
  };

  networking.hostId = "0c7dff77";
  boot.supportedFilesystems.btrfs = true;
}
