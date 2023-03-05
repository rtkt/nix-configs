{
  security.pam.loginLimits = [
    {
      domain = "*";
      item = "nproc";
      type = "hard";
      value = 6144;
    }
  ];
  security.pam.enableSSHAgentAuth = true;
  security.pam.services.sshd.sshAgentAuth = true;
  security.rtkit.enable = true;
}
