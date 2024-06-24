{
  services.logrotate.checkConfig = false;
  services.journald = {
    storage = "persistent";
    rateLimitInterval = "0";
    extraConfig = ''
      MaxRetentionSec=2month
    '';
  };
}
