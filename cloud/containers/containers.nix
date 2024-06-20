{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  containers = {
    nextcloud = {
      config = {
        pkgs,
        inputs,
        ...
      }: {
        inherit inputs;
        # modules = [
        #   inputs.sops-nix.nixosModules.sops
        # ];
        imports = [
          (import ./containers/nextcloud.nix {
            inherit config lib pkgs;
          })
        ];
        # nixpkgs.overlays = [
        #   inputs.sops-nix.overlays.default
        # ];
      };
    };
  };
}
