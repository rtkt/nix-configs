{
  services.nginx-dns = {
    enable = true;
    domain = "shitnsticks.top";
    port = 9053;
    upstream = "127.0.0.1:53";
  };
}
