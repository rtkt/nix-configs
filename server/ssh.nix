{
  services.openssh.extraConfig = ''
    GatewayPorts clientspecified
  '';

  programs.ssh.extraConfig = ''
    Host localhost
      ForwardAgent yes
  '';
}
