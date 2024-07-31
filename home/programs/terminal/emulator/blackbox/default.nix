{pkgs, ...}: {
  home.packages = with pkgs; [
    blackbox-terminal
  ];

	home.file.".local/share/blackbox/schemes".source = ./schemes;
}
