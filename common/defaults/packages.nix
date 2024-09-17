{
  config,
  pkgs,
  ...
}: {
  environment = {
    systemPackages =
      [
        pkgs.curl
      ]
      ++ (
        if config.services.displayManager.sddm.wayland.enable == true
        then [pkgs.micro-with-wl-clipboard]
        else [pkgs.micro]
      );
  };
}
