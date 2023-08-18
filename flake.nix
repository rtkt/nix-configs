{
  description = "Machine configs";
  inputs = {
    nixpkgs.url = "flake:nixpkgs/nixos-unstable";
    nix-alien = {
      url = "github:thiagokokada/nix-alien";
      inputs.nixpkgs.follows = "nixpkgs"; # not mandatory but recommended
    };
    nix-ld = {
      url = "github:Mic92/nix-ld";
      inputs.nixpkgs.follows = "nixpkgs"; # not mandatory but recommended
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    alejandra = {
      url = "github:kamadorueda/alejandra/3.0.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-overlay = {
      url = "github:rtkt/nix-overlay/352076ad85bf2c9c5af39045a1c9147effe40775";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = {
    self,
    nixpkgs,
    nix-alien,
    nix-ld,
    alejandra,
    sops-nix,
    nix-overlay,
  }: let
    system = "x86_64-linux";
    stateVersion = "21.11";
    pkgs = import nixpkgs {
      system = system;
      overlays = [
        nix-alien.overlays.default
        nix-overlay.overlays.default
        sops-nix.overlays.default
      ];

      config.allowUnfree = true;
    };
  in {
    devShells.${system}.default = import ./shell.nix {inherit pkgs;};
    nixosConfigurations.server = nixpkgs.lib.nixosSystem {
      inherit system;
      inherit pkgs;
      modules = [
        ({
          lib,
          config,
          pkgs,
          ...
        }: {
          imports = [
            (import ./common {
              inherit pkgs;
            })
            (import ./modules {
              inherit config lib pkgs;
            })
            (import ./server {
              inherit config pkgs lib;
            })
          ];
          system.stateVersion = stateVersion;
          system.configurationRevision =
            nixpkgs.lib.mkIf (self ? rev) self.rev;
          nix.registry.nixpkgs.flake = nixpkgs;
        })
        nix-overlay.nixosModules.n8n
        nix-overlay.nixosModules.ntfy
        sops-nix.nixosModules.sops
      ];
    };
    nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
      inherit system;
      inherit pkgs;
      specialArgs = {inherit self;};
      modules = [
        ({
          lib,
          config,
          pkgs,
          ...
        }: {
          imports = [
            (import ./common {
              inherit pkgs;
            })
            (import ./modules {
              inherit config lib pkgs;
            })
            (import ./desktop {
              inherit config pkgs lib;
            })
          ];
          system.stateVersion = stateVersion;
          system.configurationRevision =
            nixpkgs.lib.mkIf (self ? rev) self.rev;
          nix.registry.nixpkgs.flake = nixpkgs;
        })
        nix-overlay.nixosModules.samba-for-ps2
        sops-nix.nixosModules.sops
      ];
    };
  };
}
