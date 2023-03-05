{
  environment.variables = {
    TMOUT = "600";
  };
  networking.firewall = {
    allowedTCPPorts = [80 443];
    logRefusedConnections = false;
  };
  security.pam.loginLimits = [
    {
      domain = "*";
      item = "nproc";
      type = "hard";
      value = 1000;
    }
    {
      domain = "*";
      item = "nproc";
      type = "soft";
      value = 200;
    }
  ];
}
