{
  lib,
  pkgs,
  self,
  ...
}: let
  defaultPackage = import (self + /nix/defaultPackages.nix);

  formatters = with pkgs; [
    stylua # lua
    alejandra # nix

    # web stuff
    prettierd
    nodePackages.prettier
  ];

  linters = with pkgs; [
    nodePackages.eslint
  ];

  lsp = with pkgs; [
    nil # nix
    lua-language-server # lua

    emmet-language-server
    vscode-langservers-extracted
    nodePackages.typescript
    nodePackages.typescript-language-server
  ];
in {
  programs.neovim = {
    enable = true;
    defaultEditor = defaultPackage.editor == "neovim";
    extraLuaConfig = lib.readFile ./init.lua;
  };

  # Mason replacement
  home.packages = lsp ++ formatters ++ linters;

  xdg.configFile."nvim/lua".source = ./lua;
}
