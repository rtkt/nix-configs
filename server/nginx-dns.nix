{
  services.nginx-dns = {
    enable = true;
    domain = "shitnsticks.top";
    upstream = "127.0.0.1:53";
  };
}
