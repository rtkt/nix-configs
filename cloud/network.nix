{ lib, ... }:
{
  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.interfaces.eth0.useDHCP = lib.mkDefault true;
  networking.hostName = "cloud";
  services.vnstat.enable = true;
#  environment.etc."resolv.conf" = {
#    enable = true;
#    mode = "0444";
#    text = ''
#      nameserver 127.0.0.1
#    '';
#  };
}
