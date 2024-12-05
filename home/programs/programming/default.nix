{pkgs, ...}: let
  lua = [
    pkgs.lua
    pkgs.luarocks
  ];

  node = [
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
    ++ node
    ++ lua
    ++ zig;
}
