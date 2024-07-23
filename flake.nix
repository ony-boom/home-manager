{
  description = "My Home manager config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs
    , home-manager
    , ...
    }:
    let
      system = "x86_64-linux";
      username = "ony";
      pkgs = nixpkgs.legacyPackages.${system};
      setup = import ./nix/setup { inherit pkgs; };
    in
    {
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
