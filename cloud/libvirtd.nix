{
  virtualisation.libvirtd = {
    enable = true;
    onBoot = "start";
    onShutdown = "suspend";
    qemu.runAsRoot = false;
  };
}
