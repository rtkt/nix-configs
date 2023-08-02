{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.services.go-shadowsocks2-custom.client;
in {
  options.services.go-shadowsocks2-custom.client = {
    enable = mkEnableOption "go-shadowsocks2 client";

    connectAddress = mkOption {
      type = types.str;
      description = "Server listen address or URL";
      example = "ss://AEAD_CHACHA20_POLY1305:your-password@:8488";
    };
    extraGroups = mkOption {
      type = types.listOf types.str;
      default = [];
    };
    password = mkOption {
      type = types.nullOr types.str;
      description = "Shadowsocks server password";
      default = null;
    };
    passwordFile = mkOption {
      type = types.nullOr types.path;
      description = "File to read Shadowsocks password from";
    };
    cipher = mkOption {
      type = types.str;
      default = "AEAD_CHACHA20_POLY1305";
    };
    socksPort = mkOption {
      type = types.str;
      default = ":1080";
    };
    plugin = mkOption {
      type = types.nullOr types.str;
      default = null;
    };
    pluginOpts = mkOption {
      type = types.str;
      default = "";
    };
    udp = mkEnableOption "UDP support";
    verbose = mkEnableOption "verbose logging";
  };

  config = mkIf cfg.enable {
    systemd.services.go-shadowsocks2-custom-client = {
      description = "Customized go-shadowsocks2";
      after = ["network.target"];
      wantedBy = ["multi-user.target"];
      path = [pkgs.go-shadowsocks2] ++ optional (cfg.plugin != null) cfg.plugin;
      serviceConfig = {
        ExecStart = "${pkgs.go-shadowsocks2}/bin/go-shadowsocks2 -c '${cfg.connectAddress}' -password ${
          if cfg.password != null
          then "${cfg.password}"
          else "$PASSWORD"
        } -cipher '${cfg.cipher}' -socks '${cfg.socksPort}' ${
          if cfg.plugin != null
          then " -plugin " + cfg.plugin + " -plugin-opts " + "'${cfg.pluginOpts}'"
          else ""
        } ${
          if cfg.udp
          then " -u"
          else ""
        } ${
          if cfg.verbose
          then " -verbose"
          else ""
        }";
        DynamicUser = true;
        EnvironmentFile =
          if cfg.passwordFile != null
          then cfg.passwordFile
          else null;
        SupplementaryGroups = "${concatStringsSep " " cfg.extraGroups}";
      };
    };
  };
}
