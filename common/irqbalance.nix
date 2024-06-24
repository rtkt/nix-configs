{lib, ...}: {
  services.irqbalance.enable = lib.mkDefault true;
}
