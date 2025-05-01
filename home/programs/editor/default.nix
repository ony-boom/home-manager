{
  imports = [
    ./zed.nix
    ./neovim
  ];
  home.file.".ideavimrc".source = ./ideavimrc;
}
