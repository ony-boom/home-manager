{pkgs, ...}: let
  lua = with pkgs; [
    lua51Packages.lua
    lua51Packages.luarocks
  ];
in {
  imports = [];
  home.packages = with pkgs;
    [
      nixd
      typescript
      go
    ]
    ++ lua;
}
