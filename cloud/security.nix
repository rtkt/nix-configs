{pkgs, ...}: {
  environment.variables = {
    TMOUT = "600";
  };
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
  boot.kernelPackages = pkgs.linuxPackages_hardened;
  # environment.memoryAllocator.provider = "libc";
}
