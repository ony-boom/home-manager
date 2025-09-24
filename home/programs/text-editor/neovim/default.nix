{
  utils,
  pkgs,
  stablePkgs,
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

  home.packages = with pkgs;
    [
      # misc
      tree-sitter

      # format
      shfmt
      gofumpt
      typstyle
      gotools
      stylua
      prettierd
      alejandra
      isort
      black
      sleek
      biome

      # lsp
      nil
      eslint
      gopls
      tinymist
      typescript
      phpactor
      lua-language-server
      emmet-language-server
      svelte-language-server
      typescript-language-server
      vscode-langservers-extracted
      nodePackages."@astrojs/language-server"
    ]
    ++ (with stablePkgs; [
      tailwindcss-language-server
    ]);
}
