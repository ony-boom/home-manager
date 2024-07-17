{pkgs, ...}: let
  lua = [
    pkgs.lua
    pkgs.luarocks
  ];
in {
  home.packages = [] ++ lua;
}
