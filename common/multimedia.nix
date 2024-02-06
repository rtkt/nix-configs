{
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./ananicy.nix
  ];
  boot.kernelPackages =
    pkgs.linuxKernel.packages.linux_zen;
  security.rtkit.enable = true;
}
