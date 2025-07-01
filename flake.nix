{
  description = "My Home manager config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixgl = {
      url = "github:nix-community/nixGL";
      inputs.nixpkgs.follows = "nixpkgs-stable";
    };

    mms = {
      url = "github:ony-boom/mms";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    rust-overlay.url = "github:oxalica/rust-overlay";
  };

  nixConfig = {
    extra-substituters = [
      "https://ony-boom.cachix.org"
    ];
    extra-trusted-public-keys = [
      "ony-boom.cachix.org-1:rPOTyyOCiAhLarertCrNnZLxsBFpcirEekoohcCZt10="
    ];
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

    mkHomeConfig = hostname:
      home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {
          inherit hostname self nixgl username system;
        };
        modules = [
          ./home
          ./host
          inputs.mms.homeManagerModules.${system}
        ];
      };

    hosts = {
      work = "BCS-MG-LP-0120-09";
      home = "maki";
    };
  in {
    formatter.${system} = pkgs.alejandra;

    homeConfigurations =
      nixpkgs.lib.mapAttrs'
      (key: host: {
        name = "${username}@${host}";
        value = mkHomeConfig host;
      })
      hosts;
  };
}
