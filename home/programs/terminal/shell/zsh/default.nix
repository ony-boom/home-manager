{lib, ...}: {
  programs.zsh = {
    enable = lib.mkDefault true;
    enableCompletion = true;
    oh-my-zsh.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      lg = "lazygit";
      open = "xdg-open";
      ecr = "kitty --session sessions/eco-react.conf &";
    };

    dotDir = ".config/zsh";

    initExtra = builtins.readFile ./main.zsh;
  };
}
