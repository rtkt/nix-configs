{lib, ...}: {
  services.openssh = {
    # ports = [22222];
    extraConfig = ''
      GatewayPorts clientspecified
    '';
  };

  programs.ssh.extraConfig = ''
    Host localhost
      ForwardAgent yes
  '';

  services.sshguard = {
    blacklist_threshold = lib.mkForce 30;
    detection_time = 4800;
    whitelist = [
      "45.57.90.45"
      "185.91.179.79"
      "195.209.97.211"
    ];
  };
}
