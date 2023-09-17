{
  networking = {
    hostName = "desktop"; # Define your hostname.
    interfaces.enp2s0.useDHCP = true;
    networkmanager.enable = true;
  };
  services.coredns = {
    enable = true;
    config = ''
      .:53 {
        forward . https://45.90.57.45 {
          tls_servername shitnsticks.top
        }
      }
    '';
  };
}
