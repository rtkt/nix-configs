{
  services.logrotate.checkConfig = false;
  services.journald = {
    storage = "persistent";
    rateLimitInterval = "0";
    extraConfig = ''
      Compress=no
      MaxRetentionSec=4month
      SystemMaxUse=40G
    '';
  };
}
