{pkgs, ...}: {
  services.postgresql = {
    enable = true;
    enableJIT = true;
    package = pkgs.postgresql_16_jit;
    settings = {
      full_page_writes = false;
    };
  };
}
