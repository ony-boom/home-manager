{
  config,
  pkgs,
  username,
  ...
}: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  xdg.configFile."nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink /home/${username}/.config/home-manager/home/programs/editor/neovim/config;
    recursive = true;
  };

  home.packages = with pkgs; [
    # format
    shfmt
    alejandra
    stylua
    prettierd
    vscode-langservers-extracted

    # lsp
    nil
    lua-language-server
    vscode-langservers-extracted
    typescript-language-server
    svelte-language-server
    eslint
    tailwindcss-language-server
    nodePackages."@astrojs/language-server"
  ];
}
