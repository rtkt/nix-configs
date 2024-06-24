{lib, ...}: {
  documentation = {
    info.enable = lib.mkDefault false;
    man.generateCaches = lib.mkDefault true;
  };
}
