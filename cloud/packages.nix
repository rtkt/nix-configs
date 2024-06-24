{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = [
    pkgs.sbctl
    pkgs.nix-alien
    pkgs.xxHash
    # pkgs.tcpdump
  ];
}
