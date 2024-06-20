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
  environment.memoryAllocator.provider = "libc";
  # services.usbguard = {
  #   enable = true;
  #   presentDevicePolicy = "apply-policy";
  #   presentControllerPolicy = "apply-policy";
  #   insertedDevicePolicy = "apply-policy";
  #   implicitPolicyTarget = "block";
  # };
}
