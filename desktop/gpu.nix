{
  pkgs,
  lib,
  ...
}: {
  # hardware.video.hidpi.enable = lib.mkDefault true;
  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      libvdpau
      amdvlk
    ];
    extraPackages32 = with pkgs; [
      driversi686Linux.amdvlk
    ];
    driSupport = true;
    driSupport32Bit = true;
  };
  services.xserver.videoDrivers = ["amdgpu"];
}
