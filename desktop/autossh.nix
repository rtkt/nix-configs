{
  services.autossh.sessions = [
    {
      user = "connector";
      name = "server-tunnel";
      monitoringPort = 51000;
      extraArguments = "-N -i /var/lib/connector/.ssh/id_tunnel -R 50000:localhost:22222 connector@45.90.57.45";
    }
  ];
}
