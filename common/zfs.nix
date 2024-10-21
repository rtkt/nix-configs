{pkgs, ...}: {
  boot = {
    kernelPackages = pkgs.linuxPackages;
    supportedFilesystems.zfs = true;
  };
}
