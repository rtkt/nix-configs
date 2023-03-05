{
  config,
  lib,
  pkgs,
  ...
}: {
  boot = {
    extraModulePackages = [];
    initrd.availableKernelModules = ["ahci" "ohci_pci" "ehci_pci" "pata_atiixp" "uhci_hcd" "usb_storage" "usbhid" "sd_mod"];
    initrd.kernelModules = ["amdgpu kvm-amd"];
    kernelParams = [
      "quiet"
      "udev.log_priority=3"
      "rd.systemd.show_status=false"
      "vt.global_cursor_default=0"
      "zswap.enabled=0"
    ];
    kernel.sysctl = {
      "vm.swappiness" = 0;
      "kernel.printk" = "3 3 3 3";
    };
    loader.grub = {
      device = "/dev/disk/by-id/ata-INTEL_SSDSC2KW256G8_PHLA913305PY256CGN";
    };
  };
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  hardware.firmware = [pkgs.linux-firmware];
}
