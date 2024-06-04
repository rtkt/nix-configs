{
  programs.ssh.startAgent = true;
  programs.ssh.agentTimeout = "24h";
  security.pam.services.sshd.googleAuthenticator.enable = true;
  services.openssh = {
    enable = true;
    settings.PermitRootLogin = "no";
    allowSFTP = true;
    extraConfig = "AllowUsers rtkt connector";
  };
  services.sshguard-custom = {
    enable = true;
    blacklist_threshold = 120;
    blocktime = 600;

    ipv6_subnet = 64;
    ipv4_subnet = 24;
  };
}
