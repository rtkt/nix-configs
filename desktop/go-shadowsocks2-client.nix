{
  config,
  pkgs,
  ...
}: {
  services.go-shadowsocks2-custom.client = {
    enable = true;
    connectAddress = "shitnsticks.top:443";
    extraGroups = ["keys"];
    passwordFile = config.sops.secrets.ss-password.path;
    plugin = "${pkgs.shadowsocks-v2ray-plugin}/bin/v2ray-plugin";
    pluginOpts = "'tls;path=/anime;host=shitnsticks.top;loglevel=none;mux=32'";
    udp = true;
  };
}
