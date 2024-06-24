{
  config,
  lib,
  ...
}: {
  services.smartd = {
    enable = lib.mkDefault true;
    notifications = {
      x11.enable = lib.mkDefault config.services.xserver.enable;
      wall.enable = lib.mkDefault true;
    };
  };
}
