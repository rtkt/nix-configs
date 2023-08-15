{config, ...}: let
  proxyConfig = ''
    proxy_http_version 1.1;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection "upgrade";
    proxy_headers_hash_max_size 512;
    proxy_headers_hash_bucket_size 128;
  '';
in {
  services.nginx = {
    enable = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;
    virtualHosts = {
      "shitnsticks.top" = {
        root = "/var/www/shitnsticks.top";
        useACMEHost = "shitnsticks.top";
        forceSSL = true;
        locations."/anime" = {
          proxyPass = "http://localhost:8008";
          extraConfig = ''
            proxy_redirect off;
            ${proxyConfig}
          '';
        };
        locations."/dns-query" = {
          proxyPass = "http://127.0.0.1:8053/dns-query";
          extraConfig = ''
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header Host $host;
            proxy_set_header X-NginX-Proxy true;
            proxy_set_header Connection "";
            proxy_http_version 1.1;
            proxy_redirect off;
            proxy_set_header X-Forwarded-Proto $scheme;
            proxy_read_timeout 86400;
          '';
        };
      };
      "ntfy.shitnsticks.top" = {
        useACMEHost = "shitnsticks.top";
        forceSSL = true;
        locations."/" = {
          proxyPass = "http://${config.services.ntfy.listenHTTP}";
          extraConfig = ''
            client_max_body_size 0;
            ${proxyConfig}
          '';
        };
      };
      "n8n.shitnsticks.top" = {
        useACMEHost = "shitnsticks.top";
        forceSSL = true;
        locations."/" = {
          proxyPass = "http://localhost:${config.services.n8n-custom.settings.N8N_PORT}";
          extraConfig = ''
            ${proxyConfig}
          '';
        };
      };
    };
  };
}
