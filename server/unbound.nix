{
  services.unbound = {
    enable = true;
    settings = {
      server = {
        interface = [ "127.0.0.1" ];
        verbosity = 4;
        "do-ip6" = false;
        log-queries = true;
        log-replies = true;
        log-tag-queryreply = true;
        log-servfail = true;
      };
    };
  };
}
