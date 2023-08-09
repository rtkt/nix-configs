{
  programs.ssh.startAgent = true;
  programs.ssh.agentTimeout = "6h";
  security.pam.services.sshd.googleAuthenticator.enable = true;
  services.openssh = {
    enable = true;
    settings.PermitRootLogin = "no";
    allowSFTP = true;
    extraConfig = "AllowUsers rtkt connector";
  };
  services.sshguard = {
    enable = true;
    blacklist_threshold = 120;
    blocktime = 600;
  };
}
