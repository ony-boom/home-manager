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
    # flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nixgl,
    ...
  }: let
    username = "ony";
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      overlays = [nixgl.overlay];
    };

    setup = import ./nix/setup {inherit pkgs;};

    mkHomeConfig = host:
      home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {
          inherit self username host;
        };
        modules = [
          ./home
        ];
      };
  in {
    formatter.${system} = pkgs.alejandra;

    homeConfigurations = {
      "${username}@tosama" = mkHomeConfig "tosama";
      "${username}@bocasay" = mkHomeConfig "bocasay";
    };

    packages.${system} = {
      setupArchBased = setup.arch;
    };
  };
}
