{
  services.unbound = {
    enable = true;
    group = "nginx";
    settings = {
      server = {
        interface = [ "127.0.0.1" ];
        https-port = 8053;
        http-notls-downstream = true;

        # verbosity = 4;
        # log-queries = true;
        # log-replies = true;
        # log-tag-queryreply = true;
        # log-servfail = true;
      };
    };
  };
}
