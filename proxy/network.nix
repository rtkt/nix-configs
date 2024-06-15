{ config, lib, ...}:
{
  networking.useDHCP = lib.mkForce true;
  networking.hostName = "proxy";
}
