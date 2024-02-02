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
        nice = -20;
        rtprio = 75;
      }
      {
        type = "realtime";
        sched = "fifo";
        nice = -10;
        rtprio = 30;
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
      {
        type = "background";
        sched = "batch";
        nice = 5;
        ioclass = "best-effort";
        ionice = 5;
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
      {
        name = "clementine";
        type = "realtime";
        ioclass = "realtime";
      }
      {
        name = "dolphin";
        type = "interactive";
        ionice = 2;
      }
      {
        name = "baloorunner";
        type = "background";
      }
      {
        name = "syncthing";
        type = "background";
      }
      {
        name = "deluge-gtk";
        type = "background";
      }
      {
        name = "smbd";
        type = "background";
      }
    ];
  };
}
