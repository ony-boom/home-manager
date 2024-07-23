{pkgs, ...}: {
  imports = [./nvim];

	home.file.".ideavimrc".source = ./ideavimrc;
}
