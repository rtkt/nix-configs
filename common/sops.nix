{
  sops = {
    age.sshKeyPaths = [
      "/etc/ssh/ssh_host_ed25519_key"
      "/root/.ssh/sops-nix"
    ];
    secrets = {
      ss-password = {
        sopsFile = secrets/ss-password.yaml;
        group = "keys";
        key = "pass";
        mode = "0440";
      };
    };
  };
}
