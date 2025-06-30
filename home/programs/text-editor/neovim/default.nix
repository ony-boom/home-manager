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
    gofumpt
    gotools
    stylua
    prettierd
    alejandra
    isort
    black

    # lsp
    nil
    eslint
    gopls
    typescript
    pyright
    lua-language-server
    emmet-language-server
    svelte-language-server
    typescript-language-server
    tailwindcss-language-server
    vscode-langservers-extracted
    nodePackages."@astrojs/language-server"
  ];
}
