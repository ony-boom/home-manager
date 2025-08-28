{pkgs, ...}: let
  lua = with pkgs; [
    lua51Packages.lua
    lua51Packages.luarocks
  ];
in {
  home.packages = with pkgs;
    [
      nixd
      typescript
      go
    ]
    ++ lua;
}
