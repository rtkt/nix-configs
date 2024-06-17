{config, ...}: {
  services.smartd = {
    enable = true;
    notifications = {
      x11.enable = config.services.xserver.enable;
      wall.enable = true;
    };
  };
}
