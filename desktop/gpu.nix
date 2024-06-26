{
  pkgs,
  lib,
  ...
}: {
  # hardware.video.hidpi.enable = lib.mkDefault true;
  boot.kernelParams = [
    "amdgpu.runpm=0"
  ];
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      libvdpau
      amdvlk
      vaapiVdpau
    ];
    extraPackages32 = with pkgs; [
      driversi686Linux.amdvlk
    ];
  };
  services.xserver.videoDrivers = ["amdgpu"];
}
