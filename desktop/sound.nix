{pkgs, ...}: {
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    wireplumber.enable = true;
    extraConfig = {
      pipewire."10-config" = {
        "context.properties" = {
          "link.max-buffers" = 16;
          "mem.mlock-all" = true;
          "default.clock.rate" = 48000;
          "default.clock.quantum" = 512;
          "default.clock.min-quantum" = 32;
          "default.clock.max-quantum" = 1024;
        };
      };
      # pipewire-pulse."10-config" = {
      #   "context.modules" = [
      #     {
      #       name = "libpipewire-module-protocol-pulse";
      #        args = {
      #          "pulse.default.format" = "F32";
      #          "pulse.min.req" = "32/48000";
      #          "pulse.default.req" = "32/48000";
      #          "pulse.max.req" = "1024/48000";
      #          "pulse.min.quantum" = "32/48000";
      #          "pulse.max.quantum" = "1024/48000";
      #        };
      #      }
      #    ];
      #    "context.properties"."mem.mlock-all" = true;
      #    "stream.properties" = {
      #      "node.latency" = "32/48000";
      #      "resample.quality" = 10;
      #    };
      #  };
      client."10-config" = {
        "stream.properties" = {
          "node.latency" = "32/48000";
          "resample.quality" = 9;
          "channelmix.upmix" = false;
        };
      };
    };
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
