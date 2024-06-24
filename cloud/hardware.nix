{
  boot = {
    initrd.availableKernelModules = ["ahci" "ohci_pci" "ehci_pci" "xhci_pci" "usb_storage" "usbhid" "sd_mod"];
    initrd.kernelModules = [];
    kernelModules = ["kvm-amd" "hid_microsoft" "hid_generic" "usbhid" "xxhash_generic"];
    extraModulePackages = [];
    swraid.enable = true;
  };
  services.irqbalance.enable = false;
}
