{pkgs, ...}: {
  services.avahi = {
    enable = true;
    openFirewall = true;
    nssmdns4 = true;
    publish = {
      enable = true;
      userServices = true;
    };
  };
  services.printing = {
    enable = true;
    drivers = [pkgs.brlaser];
    stateless = true;
    listenAddresses = ["*:631"];
    allowFrom = ["all"];
    browsing = true;
    defaultShared = true;
    openFirewall = true;
  };
  hardware.printers.ensurePrinters = [
    {
      name = "Brother_HL-2035R";
      deviceUri = "usb://Brother/HL-2030%20series?serial=B1J352587";
      model = "drv:///brlaser.drv/br2030.ppd";
    }
  ];
  hardware.printers.ensureDefaultPrinter = "Brother_HL-2035R";
}
