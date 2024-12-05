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

    neovim-config.url = "github:ony-boom/neovim-config";

    rust-overlay.url = "github:oxalica/rust-overlay";

    rose-pine-hyprcursor.url = "github:ndom91/rose-pine-hyprcursor";
  };

  outputs = {
    nixpkgs,
    home-manager,
    nixgl,
    ...
  } @ inputs: let
    username = "ony";
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      overlays = [
        nixgl.overlay
        inputs.rust-overlay.overlays.default
        (prev: final: {
          rose-pine-hyprcursor = inputs.rose-pine-hyprcursor.packages.${system}.default;
        })
      ];
    };

    nixGLWrap = import ./lib/nixGL.nix {inherit pkgs;};

    stablePkgs = import inputs.nixpkgs-stable {
      inherit system;
    };

    homeSpecialArgs = {
      inherit inputs username system stablePkgs nixgl nixGLWrap;
    };

    mkHomeConfig = host:
      home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = homeSpecialArgs;
        modules = [
          ./home
        ];
      };
  in {
    formatter.${system} = pkgs.alejandra;

    nixosModules = {
      home-manager = home-manager.nixosModules.default;
      config = {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          users.${username} = import ./home;
        };
      };
    };

    homeConfigurations = {
      "${username}@bocasay" = mkHomeConfig "bocasay";
      "${username}@maki" = mkHomeConfig "maki";
    };
  };
}
