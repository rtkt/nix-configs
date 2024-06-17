{
  programs.ssh.knownHosts = {
    "github.com".publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOMqqnkVzrm0SdG6UOoqKLsabgH5C9okWi0dh2l9GKJl";
    "107.173.134.188".publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKxPbt+6oI8kQSgrDFmDOUO2VrqbrtXtbhhlRBvjIK4+";
    desktop.publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIH1Ewq8OqIKx8Gh3Nu4ZpdQxQVpZXFxVErYbaigjQjhu";
    cloud.publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJkAvGcpWUYXcoEjMtpFSGuKXA2PTBg4vid1oiG6bN6A";
    cloud.extraHostNames = ["[localhost]:50000" "([::1]:50000)"];
  };
}
