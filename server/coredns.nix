{
  services.coredns.enable = true;
  services.coredns.config = ''
    https://.:8053 {
      debug
      log
      errors

      tls /var/lib/acme/shitnsticks.top/cert.pem /var/lib/acme/shitnsticks.top/key.pem
      forward . tls://8.8.8.8 {
        tls_servername dns.google
      }
    }
  '';
}
