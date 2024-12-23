{lib, ...}: {
  programs.zsh = {
    enable = lib.mkDefault true;
    enableCompletion = true;
    oh-my-zsh.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      lg = "lazygit";
      open = "xdg-open";
    };

    dotDir = ".config/zsh";

    initExtra = builtins.readFile ./main.zsh;
  };

  # xdg.configFile."zsh/completions".source = ./completions;
}
