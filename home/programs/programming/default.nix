{
  pkgs,
  lib,
  ...
}: let
  lua = [
    pkgs.lua51Packages.lua
    pkgs.lua51Packages.luarocks
  ];
in {
  imports = [
    ./rust
  ];

  programs.rust.enable = lib.mkDefault true;

  home.packages = with pkgs;
    [
      nixd
      typescript
      go
    ]
    ++ lua;
}
