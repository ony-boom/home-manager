{pkgs, ...}: let
  lua = [
    pkgs.lua
    pkgs.luarocks
  ];

  zig = [
    pkgs.zig
  ];
in {
  imports = [
    ./rust
  ];
  home.packages = with pkgs;
    [
      jdk
      php
      bun
      typescript
    ]
    ++ lua
    ++ zig;
}
