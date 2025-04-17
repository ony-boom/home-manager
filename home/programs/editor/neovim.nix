{
  config,
  pkgs,
  ...
}: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  xdg.configFile."nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Repos/mine/neovim-config";
    recursive = true;
  };

  home.packages = with pkgs; [
    # format
    alejandra
    stylua
    prettierd
    vscode-langservers-extracted

    # lsp
    nil
    lua-language-server
    vscode-langservers-extracted
    typescript-language-server
  ];
}
