{lib, ...}: {
  boot.loader = {
    systemd-boot = {
      enable = lib.mkDefault true;
      memtest86.enable = lib.mkDefault true;
    };
    efi.efiSysMountPoint = lib.mkDefault "/boot";
    efi.canTouchEfiVariables = lib.mkDefault true;
  };
}
