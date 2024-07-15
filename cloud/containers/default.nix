{
  config,
  lib,
  pkgs,
  sops-nix,
  ...
}: {
  containers.nextcloud = {
    config = {
      config,
      lib,
      pkgs,
      ...
    }: {
      imports = [sops-nix.nixosModules.sops];
      boot.isContainer = true;
    };
  };
}
