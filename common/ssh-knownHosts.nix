{
  programs.ssh.knownHosts = {
    "github.com".publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOMqqnkVzrm0SdG6UOoqKLsabgH5C9okWi0dh2l9GKJl";
    "45.90.57.45".publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFJPyLHUwjWmsjZvwsR+kM6ic7fKrMiyneVSa5LNS+DW";
    desktop.publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIH1Ewq8OqIKx8Gh3Nu4ZpdQxQVpZXFxVErYbaigjQjhu";
    desktop.extraHostNames = ["[localhost]:50000" "([::1]:50000)"];
  };
}
