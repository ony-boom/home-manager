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
      bun
      typescript
      jdk
    ]
    ++ javascript
    ++ lua
    ++ zig;
}
