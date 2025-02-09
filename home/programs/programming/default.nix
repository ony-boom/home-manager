{pkgs, ...}: let
  lua = [
    pkgs.lua
    pkgs.luarocks
  ];

  javascript = [
    pkgs.deno
    pkgs.nodejs
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
