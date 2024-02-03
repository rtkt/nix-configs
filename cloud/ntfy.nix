{config, ...}: {
  services.ntfy = {
    enable = true;
    behindProxy = true;
    debug = false;
    attachments = {
      enable = true;
      baseURL = "http://ntfy.rtkt.cloud";
    };
  };
}
