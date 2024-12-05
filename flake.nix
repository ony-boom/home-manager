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
        (prev: final: {
          rose-pine-hyprcursor = inputs.rose-pine-hyprcursor.packages.${system}.default;
        })
      ];
    };

    nixGLWrap = import ./lib/nixGL.nix {inherit pkgs;};

    stablePkgs = import inputs.nixpkgs-stable {
      inherit system;
    };

    getHomeSpecialArgs = host: {
      inherit host self username system stablePkgs nixgl nixGLWrap;
    };

    mkHomeConfig = host:
      home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = getHomeSpecialArgs host;
        modules = [
          ./home
          inputs.neovim-config.homeManagerModules.${system}
        ];
      };

    mkHomeConfigNixosModules = host: osInputs: {
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        extraSpecialArgs = getHomeSpecialArgs host;
        modules = [
          ./home
          inputs.neovim-config.homeManagerModules.${system}
        ];
      };
    };
  in {
    formatter.${system} = pkgs.alejandra;

    nixosModules = {
      home-manager = home-manager.nixosModules;
    };

    lib = {
      inherit mkHomeConfigNixosModules;
    };

    homeConfigurations = {
      "${username}@bocasay" = mkHomeConfig "bocasay";
    };
  };
}
