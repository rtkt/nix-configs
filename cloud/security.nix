{
  lib,
  pkgs,
  ...
}: {
  security = {
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
    pam.loginLimits = [
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
    pam.services.su = {
      requireWheel = lib.mkForce true;
      rootOK = lib.mkForce false;
    };
  };
  # environment.memoryAllocator.provider = "libc";
  boot.kernelPackages = lib.mkForce pkgs.linuxPackages_hardened;
  boot.loader.systemd-boot.enable = lib.mkForce false;
  boot.lanzaboote = {
    enable = true;
    pkiBundle = "/persist/etc/secureboot";
  };
  nix.settings.allowed-users = lib.mkForce ["root"];
  services.openssh.settings.AuthenticationMethods = "publickey";
  services.openssh.hostKeys = [
    {
      path = "/persist/etc/ssh/ssh_host_rsa_key";
      type = "rsa";
    }
    {
      path = "/persist/etc/ssh/ssh_host_ed25519_key";
      type = "ed25519";
    }
  ];
}
