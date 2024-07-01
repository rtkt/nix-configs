{
  lib,
  pkgs,
  ...
}: {
  security = {
    pam.loginLimits = [
      {
        domain = "*";
        item = "nproc";
        type = "hard";
        value = 1000;
      }
      {
        domain = "*";
        item = "nproc";
        type = "soft";
        value = 200;
      }
    ];
    allowSimultaneousMultithreading = true;
    sudo.enable = lib.mkForce false;
    doas = {
      enable = true;
      wheelNeedsPassword = true;
      extraRules = [
        {
          users = ["rtkt"];
          noPass = false;
          keepEnv = true;
          persist = false;
          noLog = false;
        }
      ];
    };
    pam.services.su = {
      requireWheel = lib.mkForce true;
      rootOK = lib.mkForce false;
    };
  };
  # environment.memoryAllocator.provider = "libc";
  boot.kernelPackages = lib.mkForce pkgs.linuxPackages_hardened;
  nix.settings.allowed-users = lib.mkForce ["root"];
}
