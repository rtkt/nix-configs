{pkgs, ...}: {
  services.ananicy = {
    enable = true;
    package = pkgs.ananicy-cpp;
    rulesProvider = pkgs.ananicy-cpp;
    settings = {
      check_freq = 5;
    };
    extraTypes = [
      {
        type = "critical-ui";
        sched = "fifo";
        rtprio = 75;
      }
      {
        type = "heavy-background";
        sched = "batch";
        nice = 19;
      }
      {
        type = "interactive";
        nice = -5;
      }
    ];
    extraRules = [
      {
        name = "X";
        type = "critical-ui";
      }
      {
        name = "kwin_x11";
        type = "critical-ui";
      }
      {
         name = "pipewire";
         type = "critical-ui";
      }
      {
        name = "pipewire-pulse";
        type = "critical-ui";
      }
      {
        name = "wireplumber";
        type = "critical-ui";
      }
      {
        name = "nix-daemon";
        type = "heavy-background";
      }
      {
        name = "nix";
        type = "heavy-background";
      }
      {
        name = "vivaldi-bin";
        type = "interactive";
      }
      {
        name = "code";
        type = "interactive";
      }
      {
        name = "chromium";
        type = "interactive";
      }
    ];
  };
}
