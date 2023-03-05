{
  security.acme.defaults.email = "rtkt@protonmail.com";
  security.acme.acceptTerms = true;
  security.acme.certs."shitnsticks.top" = {
    domain = "shitnsticks.top";
    extraDomainNames = ["*.shitnsticks.top"];
    dnsProvider = "cloudflare";
    group = "nginx";
    credentialsFile = "/var/lib/acme/shitnsticks.top-cloudflare-api-token";
  };
}
