{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  boot = {
    initrd.availableKernelModules = ["ahci" "ohci_pci" "ehci_pci" "xhci_pci" "usb_storage" "usbhid" "sd_mod"];
    initrd.kernelModules = [];
    kernelModules = ["kvm-amd"];
    extraModulePackages = [];
    loader.grub.device = "/dev/disk/by-id/ata-Samsung_SSD_870_EVO_1TB_S74ZNX0W302758N";
    swraid.enable = true;
  };
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/80211811-0f30-403e-b992-4e65b4c27d53";
    fsType = "btrfs";
  };
  swapDevices = [];
}
