{pkgs, ...}: {
  users = {
    mutableUsers = false;
    defaultUserShell = pkgs.zsh;
    groups = {
      connector = {};
      keys = {};
    };
  };
}
