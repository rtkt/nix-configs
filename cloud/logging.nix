{
  services.logrotate.checkConfig = false;
  services.journald = {
    storage = "persistent";
    rateLimitInterval = "0";
    extraConfig = ''
      Compress=1G
      MaxRetentionSec=2month
      SystemMaxUse=40G
    '';
  };
}
