{
  pkgs,
  lib,
  ...
}: let
  lua = [
    pkgs.lua51Packages.lua
    pkgs.lua51Packages.luarocks
  ];

  golang = with pkgs; [
    go
    gopls
    gofumpt
    go-task
  ];
in {
  imports = [
    ./rust
  ];

  programs.rust.enable = lib.mkDefault true;

  home.packages = with pkgs;
    [
      nixd
      typescript
    ]
    ++ lua ++ golang;
}
