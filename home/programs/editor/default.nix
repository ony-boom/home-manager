{
  imports = [
    ./zed.nix
    ./neovim.nix
  ];
  home.file.".ideavimrc".source = ./ideavimrc;
}
