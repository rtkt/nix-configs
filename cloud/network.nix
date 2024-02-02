{
  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking = {
    hostName = "cloud";
    useDHCP = false;
    interfaces.enp10s0.useDHCP = true;

    hosts = {
      "127.0.0.2" = [ "rtkt.cloud" "files.rtkt.cloud" "ntfy.rtkt.cloud" "n8n.rtkt.cloud" ];
    };
  };
  services.vnstat.enable = true;
}
