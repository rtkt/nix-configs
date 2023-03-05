{
  boot.loader.grub = {
    enable = true;
    version = 2;
    extraGrubInstallArgs = ["--target=i386-pc"];
  };
}
