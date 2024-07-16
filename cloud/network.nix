{lib, ...}: let
  f = ipList: let
    command = ip: port: "iptables -A INPUT -s ${ip} -p tcp --dport ${toString port} -j ACCEPT\n";
    acceptIp = ip: map (command ip) cloudflarePorts;
    generateCommands = targets: map acceptIp ipList;
  in
    lib.concatStrings (lib.flatten (map acceptIp ipList));

  cloudflarePorts = [80 443];
  cloudflareIps = [
    "103.21.244.0/22"
    "103.22.200.0/22"
    "103.31.4.0/22"
    "104.16.0.0/12"
    "108.162.192.0/18"
    "131.0.72.0/22"
    "141.101.64.0/18"
    "162.158.0.0/15"
    "172.64.0.0/13"
    "173.246.48.0/20"
    "188.114.96.0/20"
    "190.93.240.0/20"
    "197.234.240.0/22"
    "198.41.128.0/17"
  ];
in {
  networking = {
    hostName = "cloud";
    useDHCP = false;
    interfaces.enp10s0.useDHCP = true;
    firewall = {
      allowedTCPPorts = [80 443 22];
      logRefusedConnections = false;
      # extraCommands = f cloudflareIps;
    };
  };
}
