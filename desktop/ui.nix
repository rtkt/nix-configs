{
  config,
  pkgs,
  lib,
  ...
}: {
  services.desktopManager.plasma6 = {
    enable = true;
    enableQt5Integration = true;
  };
  # Select internationalisation properties.
  i18n.defaultLocale = "ru_RU.UTF-8";
  services.displayManager.sddm = {
    enable = true;
    autoNumlock = true;
    wayland.enable = true;
  };
}
