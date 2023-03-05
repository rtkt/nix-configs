{
  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking = {
    defaultGateway = "45.90.56.1";
    hostName = "server";
    interfaces.ens3.ipv4.addresses = [
      {
        address = "45.90.57.45";
        prefixLength = 22;
      }
    ];
    nameservers = ["8.8.8.8" "8.8.4.4"];
  };
}
