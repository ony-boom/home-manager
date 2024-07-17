{
  imports = [
    ./shell
  ];
  programs = {
    eza = {
      enable = true;
      icons = true;
    };
    fzf.enable = true;
    zoxide.enable = true;
    ripgrep.enable = true;
		lazygit.enable = true;
  };
}
