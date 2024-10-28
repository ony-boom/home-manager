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

  java = [
    pkgs.jdk17
  ];
in {
  imports = [
    ./rust
  ];
  home.packages = with pkgs;
    [
      bun
      # deno
      docker
      typescript
    ]
    ++ node
    ++ lua
    ++ zig
    ++ java;
}
