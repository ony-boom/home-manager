{pkgs, ...}: let
  lua = with pkgs; [
    lua51Packages.lua
    lua51Packages.luarocks
  ];

  nim = with pkgs; [
    nimble
    nim-unwrapped
  ];
in {
  home.packages = with pkgs;
    [
      nixd
      typescript
      go
    ]
    ++ lua ++ nim;
}
