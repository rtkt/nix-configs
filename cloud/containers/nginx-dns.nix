{
  services.nginx-dns = {
    enable = true;
    domain = "shitnsticks.top";
    port = 8053;
    upstream = "127.0.0.1:53";
  };
}
