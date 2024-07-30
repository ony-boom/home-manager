{
  programs.zsh = {
    enable = true;
    oh-my-zsh.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      lg = "lazygit";
			cat = "bat";
    };

    dotDir = ".config/zsh";

    initExtra = builtins.readFile ./main.zsh;
  };
}
