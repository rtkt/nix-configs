{lib, ...}: {
  users.users = {
    nextcloud = {
      isSystemUser = true;
      uid = 10000;
    };
  };
  users.groups = {
    nextcloud.gid = 10000;
  };
}
