{
  networking = {
    hostName = "desktop"; # Define your hostname.
    interfaces.enp10s0.useDHCP = true;
    networkmanager.enable = true;
  };
}
