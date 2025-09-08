{pkgs, ...}: let
  lua = with pkgs; [
    lua51Packages.lua
    lua51Packages.luarocks
  ];
  phpPackage = with pkgs; [
    php
    php84Packages.composer
  ];
in {
  home.packages = with pkgs;
    [
      nixd
      typescript
      go
    ]
    ++ lua ++ phpPackage;
}
