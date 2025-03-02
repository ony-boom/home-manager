{pkgs, ...}: let
  lua = [
    pkgs.lua51Packages.lua
    pkgs.lua51Packages.luarocks
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
