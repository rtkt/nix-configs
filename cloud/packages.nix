{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = [
    pkgs.sbctl
    # pkgs.tcpdump
  ];
}
