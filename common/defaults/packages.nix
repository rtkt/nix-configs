{
  config,
  pkgs,
  nixpkgs,
  ...
}: {
  environment = {
    systemPackages = with pkgs; [
      curl
      nano
    ];
  };
}