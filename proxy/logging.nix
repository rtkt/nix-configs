{
  boot.kernel.sysctl."net.ipv4.conf.all.log_martians" = false;
  services.logrotate.checkConfig = false;
  services.journald = {
    storage = "persistent";
    rateLimitInterval = "0";
    extraConfig = ''
      Compress=200M
      MaxRetentionSec=2month
      SystemMaxUse=1G
    '';
  };
}
