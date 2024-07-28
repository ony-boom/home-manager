{
  lib,
  pkgs,
  ...
}: let
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

    nodePackages.typescript
    nodePackages.typescript-language-server
    vscode-langservers-extracted
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
