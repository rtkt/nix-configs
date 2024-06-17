{
  programs.ssh.startAgent = true;
  programs.ssh.agentTimeout = "24h";
  security.pam.services.sshd.googleAuthenticator.enable = true;
  services.openssh = {
    enable = true;
    allowSFTP = false;
    settings = {
      UsePAM = true;
      AuthenticationMethods = "publickey,keyboard-interactive:pam";
      PasswordAuthentication = false;
      AllowUsers = [
        "rtkt"
      ];
    };
  };
  users.users.rtkt.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKTbeXH8hv6wLYvRf2f5Zlv7thmit+FilHqTuLWOqojM rtkt@desktop"
  ];
  services.sshguard-custom = {
    enable = true;
    blacklist_threshold = 120;
    blocktime = 600;

    ipv6_subnet = 64;
    ipv4_subnet = 24;
  };
}
