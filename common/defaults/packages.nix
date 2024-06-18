{
  config,
  pkgs,
  ...
}: {
  environment = {
    systemPackages = [
      pkgs.curl
      pkgs.micro
    ];
  };
}
