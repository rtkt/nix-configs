{
  config,
  lib,
  pkgs,
  sops-nix,
  ...
}: {
  containers.nextcloud = {
    config = import ./nextcloud;
  };
}
