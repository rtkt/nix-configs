{
  pkgs,
  lib,
  ...
}: {
  # hardware.video.hidpi.enable = lib.mkDefault true;
  boot.kernelParams = [
    "amdgpu.runpm=0"
  ];
  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      libvdpau
      amdvlk
      vaapiVdpau
    ];
    extraPackages32 = with pkgs; [
      driversi686Linux.amdvlk
    ];
    driSupport = true;
    driSupport32Bit = true;
  };
  services.xserver.videoDrivers = ["amdgpu"];
}
