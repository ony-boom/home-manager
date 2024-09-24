{pkgs, ...}: let
  lua = with pkgs; [
    lua
    luarocks
  ];

  node = with pkgs; [
    nodejs
    nodePackages.pnpm
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
      deno
      typescript
    ]
    ++ node
    ++ lua
    ++ zig;
}
