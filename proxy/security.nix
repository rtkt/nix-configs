{
  environment.variables = {
    TMOUT = "600";
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
