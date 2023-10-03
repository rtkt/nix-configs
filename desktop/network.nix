{
  networking = {
    hostName = "desktop"; # Define your hostname.
    interfaces.enp2s0.useDHCP = true;
    networkmanager.enable = true;
  };
}
