{
  utils,
  pkgs,
  ...
}: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  xdg.configFile."nvim" = {
    source = utils.mkDots "/text-editor/neovim/config";
    recursive = true;
  };

  home.packages = with pkgs; [
    # misc
    tree-sitter

    # format
    shfmt
    stylua
    prettierd
    alejandra

    # lsp
    nil
    eslint
    typescript
    lua-language-server
    emmet-language-server
    svelte-language-server
    typescript-language-server
    tailwindcss-language-server
    vscode-langservers-extracted
    nodePackages."@astrojs/language-server"
  ];
}
