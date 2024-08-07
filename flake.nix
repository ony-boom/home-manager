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
    rust-overlay.url = "github:oxalica/rust-overlay";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nixgl,
    ...
  } @ inputs: let
    username = "ony";
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      overlays = [nixgl.overlay inputs.rust-overlay.overlays.default];
    };

    setup = import ./nix/setup {inherit pkgs;};

    mkHomeConfig = host:
      home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {
          inherit self username host system;
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
