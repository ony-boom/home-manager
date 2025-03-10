{
  description = "My Home manager config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixgl = {
      url = "github:nix-community/nixGL";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    neovim-config = {
      url = "github:ony-boom/neovim-config";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    rust-overlay.url = "github:oxalica/rust-overlay";
  };

  outputs = {
    nixpkgs,
    home-manager,
    nixgl,
    self,
    ...
  } @ inputs: let
    username = "ony";
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      overlays = [
        nixgl.overlay
        inputs.rust-overlay.overlays.default
      ];
    };

    stablePkgs = import inputs.nixpkgs-stable {
      inherit system;
    };

    mkHomeConfig = hostname:
      home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {
          inherit hostname self username system stablePkgs;
        };
        modules = [
          ({config, ...}: {
            nixGL.packages = nixgl.packages;
            nixpkgs.overlays = [
              (final: prev: {
                nixGL = pkg: config.lib.nixGL.wrap pkg;
              })
            ];
          })
          ./home
          ./host
          inputs.neovim-config.homeManagerModules.${system}
        ];
      };

    hosts = {
      work = "BCS-MG-LP-0120-09";
      home = "taki";
    };
  in {
    formatter.${system} = pkgs.alejandra;

    homeConfigurations = {
      "${username}@${hosts.work}" = mkHomeConfig hosts.work;
      "${username}@${hosts.home}" = mkHomeConfig hosts.home;
    };
  };
}
