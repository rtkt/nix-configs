{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./irqbalance.nix
  ];

  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  hardware.firmware = [pkgs.linux-firmware];
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  boot.kernelModules = ["k10temp" "it87"];
  environment.systemPackages = [
    pkgs.lm_sensors
  ];
  environment.etc."sysconfig/lm_sensors" = {
    mode = "0444";
    text = ''
      HWMON_MODULES="it87"
    '';
  };
}
