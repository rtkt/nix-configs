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
    recommendedProxySettings = false;
    recommendedTlsSettings = true;
    eventsConfig = ''
      worker_connections 4096;
    '';
    virtualHosts = {
      "shitnsticks.top" = {
        root = "/var/www/shitnsticks.top";
        useACMEHost = "shitnsticks.top";
        forceSSL = true;
        kTLS = true;
        listen = [
          {
            addr = "0.0.0.0";
            port = 443;
            ssl = true;
            extraParameters = [
              "backlog=4096"
            ];
          }
        ];
        locations."/anime" = {
          proxyPass = "http://localhost:8008";
          extraConfig = ''
            proxy_redirect off;
            ${proxyConfig}
          '';
        };
        #         locations."/dns" = {
        #           proxyPass = "http://localhost:8053/dns-query";
        #           extraConfig = ''
        #             proxy_set_header Host $host;
        #             proxy_set_header X-Real-IP $remote_addr;
        #           '';
        #         };
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
