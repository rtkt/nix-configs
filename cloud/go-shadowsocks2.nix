{
  config,
  pkgs,
  ...
}: {
  services.go-shadowsocks2-custom.server = {
    enable = true;
    environmentFile = config.sops.secrets.ss-password.path;
    extraGroups = ["keys"];
    listenAddress = "localhost:8008";
    plugin = "${pkgs.shadowsocks-v2ray-plugin}/bin/v2ray-plugin";
    pluginOpts = "'server;loglevel=none;path=/anime;host=shitnsticks.top;mux=96;fast-open'";
    udp = true;
  };
}
