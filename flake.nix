{
  description = "My Home manager config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixgl.url = "github:nix-community/nixGL";
  };

  outputs = {
    nixpkgs,
    home-manager,
    nixgl,
    ...
  }: let
    system = "x86_64-linux";
    username = "ony";
    pkgs = import nixpkgs {
      inherit system;
      overlays = [nixgl.overlay];
    };
    setup = import ./nix/setup {inherit pkgs;};
  in {
    formatter.${system} = pkgs.alejandra;
    packages.${system} = {
      setupArchBased = setup.arch;
      setupDebianBased = setup.debian;
    };
    homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      extraSpecialArgs = {
        inherit username;
      };
      modules = [
        ./home
      ];
    };
  };
}
