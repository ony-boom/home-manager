{pkgs, ...}: let
  lua = [
    pkgs.lua
    pkgs.luarocks
  ];
in {
  home.packages = with pkgs; [
		deno
	] ++ lua;
}
