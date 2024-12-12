{pkgs, ...}: let
  lua = [
    pkgs.lua
    pkgs.luarocks
  ];

  javascript = [
    pkgs.deno
    pkgs.pnpm
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
      # deno
      typescript
    ]
    ++ javascript
    ++ lua
    ++ zig;
}
