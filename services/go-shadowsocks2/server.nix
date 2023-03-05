{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.services.go-shadowsocks2-custom.server;
in {
  options.services.go-shadowsocks2-custom.server = {
    enable = mkEnableOption "go-shadowsocks2 server";

    listenAddress = mkOption {
      type = types.str;
      description = "Server listen address or URL";
      example = "ss://AEAD_CHACHA20_POLY1305:your-password@:8488";
    };
    password = mkOption {
      type = types.nullOr types.str;
      description = "Shadowsocks server password";
      default = null;
    };
    environmentFile = mkOption {
      type = types.nullOr types.path;
      description = "File with additional environment variables like $PASSWORD";
      default = null;
    };
    extraGroups = mkOption {
      type = types.listOf types.str;
      default = [];
    };
    cipher = mkOption {
      type = types.str;
      default = "AEAD_CHACHA20_POLY1305";
    };
    plugin = mkOption {
      type = types.nullOr types.str;
      default = null;
    };
    pluginOpts = mkOption {
      type = types.nullOr types.str;
      default = null;
    };
    udp = mkEnableOption "UDP support";
    verbose = mkEnableOption "verbose logging";
  };

  config = mkIf cfg.enable {
    systemd.services.go-shadowsocks2-custom-server = {
      description = "Customized go-shadowsocks2 server";
      after = ["network.target"];
      wantedBy = ["multi-user.target"];
      path = [pkgs.go-shadowsocks2] ++ optional (cfg.plugin != null) cfg.plugin;
      serviceConfig = {
        ExecStart = "${pkgs.go-shadowsocks2}/bin/go-shadowsocks2 -s '${cfg.listenAddress}' -password ${
          if cfg.password != null
          then "${cfg.password}"
          else "$PASSWORD"
        } -cipher '${cfg.cipher}' ${
          if cfg.plugin != null
          then " -plugin " + cfg.plugin + " -plugin-opts " + cfg.pluginOpts
          else ""
        } ${
          if cfg.udp
          then "-udp"
          else ""
        } ${
          if cfg.verbose
          then " -verbose"
          else ""
        }";
        DynamicUser = true;
        EnvironmentFile =
          if cfg.environmentFile != null
          then cfg.environmentFile
          else null;
        SupplementaryGroups = "${concatStringsSep " " cfg.extraGroups}";
      };
    };
  };
}
