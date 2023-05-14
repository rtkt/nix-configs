{
  config,
  pkgs,
  lib,
  ...
}: {
  services.xserver = {
    enable = true;
    displayManager.sddm.enable = true;
    desktopManager.plasma5.enable = true;
    layout = "us,ru";
    xkbOptions = "grp:caps_toggle,grp_led:scroll";
    deviceSection = ''
      Option "VariableRefresh" "true"
    '';
  };

  # Select internationalisation properties.
  i18n.defaultLocale = "ru_RU.UTF-8";

  programs.zsh.ohMyZsh.plugins = [
    "systemd"
    "bgnotify"
    "common-aliases"
  ];

  services.xserver.displayManager.sddm = {
    autoNumlock = true;
  };
}
