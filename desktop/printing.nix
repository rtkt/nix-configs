{pkgs, ...}: {
  services.printing = {
    enable = true;
    drivers = [pkgs.brlaser];
    stateless = true;
  };
  hardware.printers.ensurePrinters = [
    {
      name = "Brother_HL-2035R";
      deviceUri = "usb://Brother/HL-2030%20series?serial=B1J352587";
      model = "drv:///brlaser.drv/br2030.ppd";
    }
  ];
}
