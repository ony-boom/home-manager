{
  imports = [./vscode];

  programs.neovim.enable = true;
  home.file.".ideavimrc".source = ./ideavimrc;
}
