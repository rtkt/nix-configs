{
  boot = {
    initrd.availableKernelModules = ["ahci" "ohci_pci" "ehci_pci" "xhci_pci" "usb_storage" "usbhid" "sd_mod"];
    initrd.kernelModules = [];
    kernelModules = ["kvm-amd" "hid_microsoft" "hid_generic" "usbhid" "xt_conntrack" "xt_mark"];
    extraModulePackages = [];
    supportedFilesystems = {
      vfat = true;
      zfs = true;
    };
  };
  services.irqbalance.enable = false;
  networking.hostId = "2aa4624b";
}
