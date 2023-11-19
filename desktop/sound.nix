{pkgs, ...}: {
  sound.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };
  environment.etc = let
    json = pkgs.formats.json {};
  in {
    "pipewire/pipewire.conf.d/10-config.conf".source = json.generate "10-config.conf" {
      context.properties = {
        link.max-buffers = 16;
        mem.mlock-all = true;
        default.clock.rate = 48000;
        default.clock.quantum = 32;
        default.clock.min-quantum = 32;
        default.clock.max-quantum = 1024;
      };
    };
    "pipewire/pipewire.pulse.d/10-config.conf".source = json.generate "10-config.conf" {
      context.modules = [
        {
          name = "libpipewire-module-protocol-pulse";
          args = {
            pulse.min.req = "32/48000";
            pulse.default.req = "32/48000";
            pulse.max.req = "1024/48000";
            pulse.min.quantum = "32/48000";
            pulse.max.quantum = "1024/48000";
          };
        }
      ];
      context.properties = {
        mem.mlock-all = true;
      };
      stream.properties = {
        node.latence = "32/48000";
        resample.quality = 10;
      };
    };
    "pipewire/client.conf.d/10-config.conf".source = json.generate "10-config.conf" {
      context.properties = {
        mem.mlock-all = true;
      };
      stream.properties = {
        node.latency = "32/48000";
        resample.quality = 10;
        channelmix.upmix = true;
      };
    };
    "wireplumber/config.lua.d/10-config.lua".text = ''
      alsa_monitor.properties = {
        ["alsa.reserve"] = true
        ["alsa.reserve.priority"] = -20
        ["alsa.reserve.application-name"] = "WirePlumber"
      },
      alsa_monitor.rules = {
        matches = {
          { "node.name", "matches", "alsa_output.*" },
        },
        apply_properties = {
          ["api.acp.probe-rate"] = 48000
          ["audio.rate"] = 48000
          ["audio.channels"] = 2
          ["api.alsa.period-size"] = 32
          ["api.alsa.disable-batch"] = true
        }
      }
    '';
  };
  security.pam.loginLimits = [
    {
      domain = "@pipewire";
      item = "memlock";
      type = "-";
      value = "400000";
    }
    {
      domain = "@pipewire";
      item = "rtprio";
      type = "-";
      value = "95";
    }
    {
      domain = "@pipewire";
      item = "nice";
      type = "-";
      value = "-19";
    }
  ];
}
