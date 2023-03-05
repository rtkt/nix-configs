{
  services.journald.extraConfig = ''
    Compress=100M
    MaxRetentionSec=1month
    Audit=no
  '';
}
