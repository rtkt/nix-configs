{
  services.davfs2 = {
    enable = true;
  };
  users.users.rtkt.extraGroups = [
    "davfs2"
  ];
}
