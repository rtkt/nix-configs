{
  boot.extraModprobeConfig = ''
    options zfs zfs_nopwrite_enabled=1
  '';
}
