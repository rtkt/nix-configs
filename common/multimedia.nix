{
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./ananicy.nix
  ];
  boot.kernelPackages = lib.mkForce pkgs.linuxKernel.packages.linux_zen;
  security.rtkit.enable = true;
}
