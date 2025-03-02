{
  imports = [
    ./zed.nix
  ];
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
  home.file.".ideavimrc".source = ./ideavimrc;
}
