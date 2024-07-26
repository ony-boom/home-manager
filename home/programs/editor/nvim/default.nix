{
  lib,
  pkgs,
  ...
}: let
  formatters = with pkgs; [
    stylua # lua
    alejandra # nix
  ];

  linters = with pkgs; [
    eslint_d
    nodePackages.jsonlint
  ];

  lsp = with pkgs; [
    nil # nix
    lua-language-server # lua
  ];
in {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    extraLuaConfig = lib.readFile ./init.lua;
  };

  # Mason replacement
  home.packages = lsp ++ formatters ++ linters;

  xdg.configFile."nvim/lua".source = ./lua;
}
