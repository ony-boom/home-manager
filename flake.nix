{
  description = "My Home manager config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/25.05";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixgl = {
      url = "github:nix-community/nixGL";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    mms = {
      url = "github:ony-boom/mms";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ditto.url = "github:ony-boom/ditto";
    agenix.url = "github:ryantm/agenix";

    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    walker.url = "github:abenz1267/walker";
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
        inputs.ditto.overlays.${system}.default
      ];
    };

    stablePkgs = import inputs.nixpkgs-stable {inherit system;};

    mkHomeConfig = hostname:
      home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {
          inherit hostname self nixgl username system stablePkgs inputs;
        };
        modules = [
          ./home
          ./host
          inputs.agenix.homeManagerModules.default
          inputs.mms.homeManagerModules.${system}
        ];
      };

    hosts = {
      work = "BCS-MG-LP-0120-09";
      home = "maki";
    };
  in {
    formatter.${system} = pkgs.alejandra;

    apps.${system}.hm = {
      type = "app";
      program = "${pkgs.home-manager}/bin/home-manager";
    };

    homeConfigurations =
      nixpkgs.lib.mapAttrs'
      (key: host: {
        name = "${username}@${host}";
        value = mkHomeConfig host;
      })
      hosts;
  };
}
