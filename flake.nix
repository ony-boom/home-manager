{
  description = "My Home manager config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    username = "ony";
    pkgs = nixpkgs.legacyPackages.${system};
    setup = import ./nix/setup.nix {inherit pkgs;};
  in {
    formatter.${system} = pkgs.alejandra;
    packages.${system} = {
      setupArchBased = setup.arch;
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
