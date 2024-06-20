{
  lib,
  pkgs,
  ...
}: {
  security.pam.loginLimits = [
    {
      domain = "*";
      item = "nproc";
      type = "hard";
      value = 5000;
    }
    {
      domain = "*";
      item = "nproc";
      type = "soft";
      value = 1000;
    }
  ];
  sound.enable = false;
  # environment.noXlibs = true;
  # environment.memoryAllocator.provider = "libc";
  security.allowSimultaneousMultithreading = true;
  boot.kernelPackages = lib.mkForce pkgs.linuxPackages_hardened;
}
