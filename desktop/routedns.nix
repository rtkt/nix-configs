{
  services.routedns.enable = true;
  services.routedns.settings = {
    bootstrap-resolver = {
      address = "https://1.1.1.1/dns-query";
      protocol = "doh";
    };
    resolvers.private = {
      address = "https://shitnsticks.top/dns-query";
      protocol = "doh";
    };
    groups.private-cached = {
      type = "cache";
      resolvers = ["private"];
    };
    listeners.local-tcp = {
      address = "127.0.0.1:53";
      protocol = "tcp";
      resolver = "private-cached";
    };
    listeners.local-udp = {
      address = "127.0.0.1:53";
      protocol = "udp";
      resolver = "private-cached";
    };
  };
}
