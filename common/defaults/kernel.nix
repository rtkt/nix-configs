{
  lib,
  pkgs,
  ...
}: {
  boot.kernelPackages = lib.mkOptionDefault pkgs.linuxPackages_latest;
}
