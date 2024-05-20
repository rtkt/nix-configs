{
  config,
  pkgs,
  lib,
  ...
}: {
  services.xserver = {
    enable = true;
    desktopManager.plasma5.enable = true;
    deviceSection = ''
      Option "VariableRefresh" "true"
    '';
    xkb = {
      options = "grp:caps_toggle,grp_led:scroll";
      layout = "us,ru";
    };
  };

  # Select internationalisation properties.
  i18n.defaultLocale = "ru_RU.UTF-8";

  services.displayManager.sddm = {
    enable = true;
    autoNumlock = true;
  };
}
