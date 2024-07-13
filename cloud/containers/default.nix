{
  networking.firewall.allowedTCPPorts = [9000];
  virtualisation.oci-containers.containers.nextcloud = {
    image = "nextcloud/all-in-one:latest";
    hostname = "nextcloud";
    ports = [
      "8443:9000"
    ];
  };
}
