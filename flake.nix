{
  description = "My Home manager config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixgl = {
      url = "github:nix-community/nixGL";
    };
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    nixpkgs,
    home-manager,
    nixgl,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        username = "ony";
        pkgs = import nixpkgs {
          inherit system;
          overlays = [nixgl.overlay];
        };
        setup = import ./nix/setup {inherit pkgs;};
        mkHomeConfig = host:
          home-manager.lib.homeManagerConfiguration {
            inherit pkgs;
            extraSpecialArgs = {
              inherit username host;
            };
            modules = [
              ./home
            ];
          };
      in {
        formatter = pkgs.alejandra;
        packages = {
          setupArchBased = setup.arch;
          homeConfigurations = {
            "${username}@tosama" = mkHomeConfig "tosama";
            "${username}@bocasay" = mkHomeConfig "bocasay";
          };
        };
      }
    );
}
