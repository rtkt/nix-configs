{pkgs, ...}: {
  users = {
    mutableUsers = false;
    groups = {
      connector = {};
      keys = {};
    };
  };
}
