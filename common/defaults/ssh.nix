{lib, ...}: {
  security.pam.services.sshd.googleAuthenticator.enable = lib.mkDefault true;
  services.openssh = {
    enable = lib.mkDefault true;
    allowSFTP = lib.mkDefault false;
    settings = {
      UsePAM = lib.mkDefault true;
      AuthenticationMethods = lib.mkDefault "publickey,keyboard-interactive:pam";
      KbdInteractiveAuthentication = lib.mkDefault true;
      LogLevel = lib.mkDefault "VERBOSE";
      PermitRootLogin = lib.mkDefault "no";
      AllowUsers = [
        "rtkt"
      ];
    };
  };
  users.users.rtkt.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKTbeXH8hv6wLYvRf2f5Zlv7thmit+FilHqTuLWOqojM rtkt@desktop"
  ];
  services.sshguard-custom = {
    enable = lib.mkDefault true;
    blacklist_threshold = lib.mkDefault 120;
    blocktime = lib.mkDefault 600;
    ipv6_subnet = lib.mkDefault 64;
    ipv4_subnet = lib.mkDefault 24;
    whitelist = [
      "185.91.179.79"
      "100.65.0.19"
    ];
  };
  programs.ssh = {
    startAgent = lib.mkDefault true;
    agentTimeout = lib.mkDefault "120h";
    knownHosts = {
      "github.com".publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOMqqnkVzrm0SdG6UOoqKLsabgH5C9okWi0dh2l9GKJl";
      "107.173.134.188".publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKxPbt+6oI8kQSgrDFmDOUO2VrqbrtXtbhhlRBvjIK4+";
      desktop.publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIH1Ewq8OqIKx8Gh3Nu4ZpdQxQVpZXFxVErYbaigjQjhu";
      cloud.publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJkAvGcpWUYXcoEjMtpFSGuKXA2PTBg4vid1oiG6bN6A";
      cloud.extraHostNames = ["[localhost]:50000" "([::1]:50000)" "n8n.rtkt.cloud" "files.rtkt.cloud"];
    };
  };
}
