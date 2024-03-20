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
    ../common/multimedia.nix
    ../common/nozswap.nix

    # ./autossh.nix
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
    # ./syncthing.nix
    ./tmpfs.nix
    ./ui.nix
    ./users.nix
  ];
  # sound.enable = true;
  # services.pipewire = {
  #   enable = true;
  #   pulse.enable = true;
  #   wireplumber.enable = true;
  # };
}
