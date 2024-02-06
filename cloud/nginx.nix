{
  config,
  pkgs,
  ...
}: let
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
    # additionalModules = [
    #   pkgs.nginxModules.njs
    # ];
    recommendedProxySettings = false;
    # recommendedTlsSettings = true;
    eventsConfig = ''
      worker_connections 4096;
    '';
    virtualHosts = {
      "rtkt.cloud" = {
        root = "/var/www/rtkt.cloud";
        # useACMEHost = "shitnsticks.top";
        # forceSSL = true;
        # kTLS = true;
        listen = [
          {
            addr = "0.0.0.0";
            port = 80;
            # ssl = true;
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
      };
      "ntfy.rtkt.cloud" = {
        # useACMEHost = "shitnsticks.top";
        # forceSSL = true;
        locations."/" = {
          proxyPass = "http://${config.services.ntfy.listenHTTP}";
          extraConfig = ''
            client_max_body_size 0;
            ${proxyConfig}
          '';
        };
      };
      "n8n.rtkt.cloud" = {
        # useACMEHost = "shitnsticks.top";
        # forceSSL = true;
        locations."/" = {
          proxyPass = "http://localhost:${builtins.toString config.services.n8n-custom.port}";
          extraConfig = ''
            ${proxyConfig}
          '';
        };
      };
    };
  };
}
