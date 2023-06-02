{
  networking.firewall = {
    allowedTCPPorts = [22222];
    logRefusedConnections = false;
    extraCommands = ''
      iptables -A INPUT -s 103.21.244.0/22 -p tcp --dport 80 -j ACCEPT &&
      iptables -A INPUT -s 103.22.200.0/22 -p tcp --dport 80 -j ACCEPT &&
      iptables -A INPUT -s 103.31.4.0/22 -p tcp --dport 80 -j ACCEPT &&
      iptables -A INPUT -s 104.16.0.0/12 -p tcp --dport 80 -j ACCEPT &&
      iptables -A INPUT -s 108.162.192.0/18 -p tcp --dport 80 -j ACCEPT &&
      iptables -A INPUT -s 131.0.72.0/22 -p tcp --dport 80 -j ACCEPT &&
      iptables -A INPUT -s 141.101.64.0/18 -p tcp --dport 80 -j ACCEPT &&
      iptables -A INPUT -s 162.158.0.0/15 -p tcp --dport 80 -j ACCEPT &&
      iptables -A INPUT -s 172.64.0.0/13 -p tcp --dport 80 -j ACCEPT &&
      iptables -A INPUT -s 173.245.48.0/20 -p tcp --dport 80 -j ACCEPT &&
      iptables -A INPUT -s 188.114.96.0/20 -p tcp --dport 80 -j ACCEPT &&
      iptables -A INPUT -s 190.93.240.0/20 -p tcp --dport 80 -j ACCEPT &&
      iptables -A INPUT -s 197.234.240.0/22 -p tcp --dport 80 -j ACCEPT &&
      iptables -A INPUT -s 198.41.128.0/17 -p tcp --dport 80 -j ACCEPT &&
      iptables -A INPUT -s 103.21.244.0/22 -p tcp --dport 443 -j ACCEPT &&
      iptables -A INPUT -s 103.22.200.0/22 -p tcp --dport 443 -j ACCEPT &&
      iptables -A INPUT -s 103.31.4.0/22 -p tcp --dport 443 -j ACCEPT &&
      iptables -A INPUT -s 104.16.0.0/12 -p tcp --dport 443 -j ACCEPT &&
      iptables -A INPUT -s 108.162.192.0/18 -p tcp --dport 443 -j ACCEPT &&
      iptables -A INPUT -s 131.0.72.0/22 -p tcp --dport 443 -j ACCEPT &&
      iptables -A INPUT -s 141.101.64.0/18 -p tcp --dport 443 -j ACCEPT &&
      iptables -A INPUT -s 162.158.0.0/15 -p tcp --dport 443 -j ACCEPT &&
      iptables -A INPUT -s 172.64.0.0/13 -p tcp --dport 443 -j ACCEPT &&
      iptables -A INPUT -s 173.245.48.0/20 -p tcp --dport 443 -j ACCEPT &&
      iptables -A INPUT -s 188.114.96.0/20 -p tcp --dport 443 -j ACCEPT &&
      iptables -A INPUT -s 190.93.240.0/20 -p tcp --dport 443 -j ACCEPT &&
      iptables -A INPUT -s 197.234.240.0/22 -p tcp --dport 443 -j ACCEPT &&
      iptables -A INPUT -s 198.41.128.0/17 -p tcp --dport 443 -j ACCEPT &&
    '';
  };
}
