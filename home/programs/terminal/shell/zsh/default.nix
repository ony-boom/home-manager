{
  programs.zsh = {
    enable = true;
    oh-my-zsh.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      lg = "lazygit";
    };

		dotDir = ".config/zsh";

		initExtra = builtins.readFile ./main.zsh
  };
}
