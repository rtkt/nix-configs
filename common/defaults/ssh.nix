{
  security.pam.services.sshd.googleAuthenticator.enable = true;
  services.openssh = {
    enable = true;
    allowSFTP = false;
    settings = {
      UsePAM = true;
      AuthenticationMethods = "publickey,keyboard-interactive:pam";
      KbdInteractiveAuthentication = true;
      PermitRootLogin = "no";
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
  programs.ssh = {
    startAgent = true;
    agentTimeout = "24h";
    knownHosts = {
      "github.com".publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOMqqnkVzrm0SdG6UOoqKLsabgH5C9okWi0dh2l9GKJl";
      "107.173.134.188".publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKxPbt+6oI8kQSgrDFmDOUO2VrqbrtXtbhhlRBvjIK4+";
      desktop.publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIH1Ewq8OqIKx8Gh3Nu4ZpdQxQVpZXFxVErYbaigjQjhu";
      cloud.publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJkAvGcpWUYXcoEjMtpFSGuKXA2PTBg4vid1oiG6bN6A";
      cloud.extraHostNames = ["[localhost]:50000" "([::1]:50000)"];
    };
  };
}
