{pkgs, ...}: let
  lua = [
    pkgs.lua
    pkgs.luarocks
  ];

  javascript = [
    pkgs.deno
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
    ++ javascript
    ++ lua
    ++ zig;
}
