{
  description = "Machine configs";
  inputs = {
    nixpkgs.url = "flake:nixpkgs/nixos-unstable";
    nix-alien = {
      url = "github:thiagokokada/nix-alien";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-ld = {
      url = "github:Mic92/nix-ld";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    pre-commit-hooks = {
      url = "github:cachix/pre-commit-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-overlay = {
      url = "github:rtkt/nix-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = {
    self,
    nixpkgs,
    nix-alien,
    nix-ld,
    pre-commit-hooks,
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
    checks = {
      pre-commit-check = pre-commit-hooks.lib.${system}.run {
        src = ./.;
        hooks = {
          alejandra.enable = true;
        };
      };
    };
    devShells.${system}.default = nixpkgs.legacyPackages.${system}.mkShell {
      inherit (self.checks.pre-commit-check) shellHook;
      buildInputs = self.checks.pre-commit-check.enabledPackages;
    };
    formatter.${system} = nixpkgs.legacyPackages.${system}.alejandra;
    # nixosConfigurations.server = nixpkgs.lib.nixosSystem {
    #   inherit system;
    #   inherit pkgs;
    #   modules = [
    #     ({
    #       lib,
    #       config,
    #       pkgs,
    #       ...
    #     }: {
    #       imports = [
    #         (import ./common/defaults {
    #           inherit config lib pkgs;
    #         })
    #         (import ./modules {
    #           inherit config lib pkgs;
    #         })
    #         (import ./server {
    #           inherit config pkgs lib;
    #         })
    #       ];
    #       system.stateVersion = stateVersion;
    #       system.configurationRevision =
    #         nixpkgs.lib.mkIf (self ? rev) self.rev;
    #       nix.registry.nixpkgs.flake = nixpkgs;
    #     })
    #     sops-nix.nixosModules.sops
    #   ];
    # };
    nixosConfigurations.cloud = nixpkgs.lib.nixosSystem {
      inherit system;
      inherit pkgs;
      modules = [
        ({
          lib,
          config,
          modulesPath,
          pkgs,
          ...
        }: {
          imports = [
            (modulesPath + "/profiles/hardened.nix")
            (import ./common/defaults {
              inherit config lib pkgs;
            })
            (import ./modules {
              inherit config lib pkgs;
            })
            (import ./cloud {
              inherit config pkgs lib;
            })
          ];
          system.stateVersion = "23.11";
          system.configurationRevision =
            nixpkgs.lib.mkIf (self ? rev) self.rev;
          nix.registry.nixpkgs.flake = nixpkgs;
        })
        nix-overlay.nixosModules.sshguard-custom
        nix-overlay.nixosModules.n8n
        nix-overlay.nixosModules.ntfy
        nix-overlay.nixosModules.samba-for-ps2
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
            (import ./common/defaults {
              inherit config lib pkgs;
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
        nix-overlay.nixosModules.sshguard-custom
        sops-nix.nixosModules.sops
      ];
    };
  };
}
